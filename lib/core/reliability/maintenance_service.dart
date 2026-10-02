import 'dart:io';

import 'package:drift/drift.dart';

import '../database/app_database.dart';

class DatabaseHealth {
  const DatabaseHealth({
    required this.integrityOk,
    required this.foreignKeysOk,
  });
  final bool integrityOk, foreignKeysOk;
  bool get healthy => integrityOk && foreignKeysOk;
}

class MaintenanceService {
  MaintenanceService(this._database);
  final AppDatabase _database;
  Future<DatabaseHealth> checkDatabase() async {
    final integrity = await _database
        .customSelect('PRAGMA integrity_check')
        .get();
    final foreign = await _database
        .customSelect('PRAGMA foreign_key_check')
        .get();
    return DatabaseHealth(
      integrityOk:
          integrity.isNotEmpty && integrity.first.data.values.first == 'ok',
      foreignKeysOk: foreign.isEmpty,
    );
  }

  Future<int> cleanupTemporaryReports(
    Directory directory, {
    Duration olderThan = const Duration(days: 1),
  }) async {
    if (!await directory.exists()) return 0;
    var removed = 0;
    await for (final entity in directory.list(followLinks: false)) {
      if (entity is File &&
          (entity.path.endsWith('.pdf') || entity.path.endsWith('.csv')) &&
          DateTime.now().difference(await entity.lastModified()) > olderThan) {
        await entity.delete();
        removed++;
      }
    }
    return removed;
  }

  Future<int> cleanupOldBackups(Directory directory, {int keep = 5}) async {
    if (!await directory.exists()) return 0;
    final files = [
      await for (final entity in directory.list())
        if (entity is File && entity.path.endsWith('.mmbd')) entity,
    ]..sort((a, b) => b.lastModifiedSync().compareTo(a.lastModifiedSync()));
    var removed = 0;
    for (final file in files.skip(keep)) {
      await file.delete();
      removed++;
    }
    return removed;
  }

  Future<int> cleanupOrphanAttachments(Directory directory) async {
    if (!await directory.exists()) return 0;
    final rows = await _database.select(_database.attachments).get();
    final known = rows
        .map((row) => row.relativePath.replaceAll('\\', '/'))
        .toSet();
    var removed = 0;
    await for (final entity in directory.list(
      recursive: true,
      followLinks: false,
    )) {
      if (entity is File) {
        final relative = entity.path
            .substring(directory.path.length)
            .replaceFirst(RegExp(r'^[/\\]+'), '')
            .replaceAll('\\', '/');
        if (!known.contains(relative)) {
          await entity.delete();
          removed++;
        }
      }
    }
    return removed;
  }
}
