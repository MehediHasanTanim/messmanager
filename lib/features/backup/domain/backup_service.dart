import 'dart:convert';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:sqlite3/sqlite3.dart';

class BackupManifest {
  const BackupManifest({
    required this.formatVersion,
    required this.appVersion,
    required this.databaseVersion,
    required this.createdAt,
    required this.messSummary,
  });
  final int formatVersion, databaseVersion;
  final String appVersion;
  final DateTime createdAt;
  final Map<String, dynamic> messSummary;
  Map<String, dynamic> toJson() => {
    'formatVersion': formatVersion,
    'appVersion': appVersion,
    'databaseVersion': databaseVersion,
    'createdAt': createdAt.toUtc().toIso8601String(),
    'mess': messSummary,
  };
  factory BackupManifest.fromJson(Map<String, dynamic> json) => BackupManifest(
    formatVersion: json['formatVersion'] as int,
    appVersion: json['appVersion'] as String,
    databaseVersion: json['databaseVersion'] as int,
    createdAt: DateTime.parse(json['createdAt'] as String),
    messSummary: Map<String, dynamic>.from(json['mess'] as Map),
  );
}

class BackupPreview {
  const BackupPreview({required this.manifest, required this.attachmentCount});
  final BackupManifest manifest;
  final int attachmentCount;
}

class BackupService {
  static const formatVersion = 1;
  const BackupService();
  Future<File> create({
    required File databaseFile,
    required Directory attachmentsDirectory,
    required Directory destinationDirectory,
    required String appVersion,
    required int databaseVersion,
    Map<String, dynamic> messSummary = const {},
  }) async {
    if (!await databaseFile.exists())
      throw StateError('Database file not found.');
    await destinationDirectory.create(recursive: true);
    final output = File(
      '${destinationDirectory.path}/backup-${DateTime.now().toUtc().toIso8601String().replaceAll(':', '-')}.mmbd',
    );
    final encoder = ZipFileEncoder();
    encoder.create(output.path);
    encoder.addArchiveFile(
      ArchiveFile(
        'manifest.json',
        0,
        utf8.encode(
          jsonEncode(
            BackupManifest(
              formatVersion: formatVersion,
              appVersion: appVersion,
              databaseVersion: databaseVersion,
              createdAt: DateTime.now(),
              messSummary: messSummary,
            ).toJson(),
          ),
        ),
      ),
    );
    await encoder.addFile(databaseFile, 'database.sqlite');
    if (await attachmentsDirectory.exists()) {
      await for (final entity in attachmentsDirectory.list(
        recursive: true,
        followLinks: false,
      )) {
        if (entity is File) {
          final relative = _safeRelative(
            attachmentsDirectory.path,
            entity.path,
          );
          await encoder.addFile(entity, 'attachments/$relative');
        }
      }
    }
    encoder.close();
    await preview(output, supportedDatabaseVersion: databaseVersion);
    return output;
  }

  Future<BackupPreview> preview(
    File archiveFile, {
    required int supportedDatabaseVersion,
  }) async {
    final archive = await _read(archiveFile);
    final manifestFile = archive.findFile('manifest.json');
    final db = archive.findFile('database.sqlite');
    if (manifestFile == null || db == null)
      throw const FormatException(
        'Backup requires manifest.json and database.sqlite.',
      );
    final manifest = BackupManifest.fromJson(
      jsonDecode(utf8.decode(manifestFile.readBytes()!))
          as Map<String, dynamic>,
    );
    if (manifest.formatVersion != formatVersion)
      throw const FormatException('Unsupported backup format.');
    if (manifest.databaseVersion > supportedDatabaseVersion)
      throw const FormatException(
        'Backup was created by a newer database version.',
      );
    return BackupPreview(
      manifest: manifest,
      attachmentCount: archive.files
          .where((f) => f.name.startsWith('attachments/'))
          .length,
    );
  }

  Future<File> restore({
    required File archiveFile,
    required File liveDatabaseFile,
    required Directory liveAttachmentsDirectory,
    required int supportedDatabaseVersion,
  }) async {
    final archive = await _read(archiveFile);
    await preview(
      archiveFile,
      supportedDatabaseVersion: supportedDatabaseVersion,
    );
    final temp = await Directory.systemTemp.createTemp('mmbd-restore-');
    try {
      final stagedDb = File('${temp.path}/database.sqlite');
      final stagedAttachments = Directory('${temp.path}/attachments');
      await stagedAttachments.create();
      for (final entry in archive.files) {
        if (entry.isFile &&
            (entry.name == 'database.sqlite' ||
                entry.name.startsWith('attachments/'))) {
          _assertSafeEntry(entry.name);
          final target = entry.name == 'database.sqlite'
              ? stagedDb
              : File(
                  '${stagedAttachments.path}/${entry.name.substring('attachments/'.length)}',
                );
          await target.parent.create(recursive: true);
          await target.writeAsBytes(entry.readBytes()!);
        }
      }
      _integrityCheck(stagedDb.path);
      final safety = File(
        '${liveDatabaseFile.path}.safety-${DateTime.now().millisecondsSinceEpoch}',
      );
      if (await liveDatabaseFile.exists())
        await liveDatabaseFile.copy(safety.path);
      final attachmentSafety = Directory(
        '${liveAttachmentsDirectory.path}.safety-${DateTime.now().millisecondsSinceEpoch}',
      );
      if (await liveAttachmentsDirectory.exists())
        await liveAttachmentsDirectory.rename(attachmentSafety.path);
      await liveDatabaseFile.parent.create(recursive: true);
      await stagedDb.copy(liveDatabaseFile.path);
      await stagedAttachments.rename(liveAttachmentsDirectory.path);
      return safety;
    } catch (_) {
      rethrow;
    } finally {
      if (await temp.exists()) await temp.delete(recursive: true);
    }
  }

  Future<Archive> _read(File file) async {
    if (!await file.exists() || file.lengthSync() == 0)
      throw const FormatException('Invalid backup archive.');
    try {
      final archive = ZipDecoder().decodeBytes(
        await file.readAsBytes(),
        verify: true,
      );
      for (final entry in archive.files) _assertSafeEntry(entry.name);
      return archive;
    } catch (e) {
      throw FormatException('Invalid backup archive: $e');
    }
  }

  static String _safeRelative(String root, String path) {
    final relative = path
        .substring(root.length)
        .replaceFirst(RegExp(r'^[/\\]+'), '');
    _assertSafeEntry(relative);
    return relative.replaceAll('\\', '/');
  }

  static void _assertSafeEntry(String entry) {
    if (entry.isEmpty ||
        entry.startsWith('/') ||
        entry.startsWith('\\') ||
        entry.split(RegExp(r'[/\\]+')).any((part) => part == '..'))
      throw const FormatException('Unsafe archive path.');
  }

  static void _integrityCheck(String path) {
    final db = sqlite3.open(path);
    try {
      final result = db.select('PRAGMA integrity_check');
      if (result.isEmpty || result.first.values.first != 'ok')
        throw const FormatException('SQLite integrity check failed.');
    } finally {
      db.close();
    }
  }
}
