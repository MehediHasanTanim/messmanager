import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mess_manager_bd/features/backup/domain/backup_service.dart';
import 'package:sqlite3/sqlite3.dart';

void main() {
  test('backup and restore round-trip database and attachments', () async {
    final root = await Directory.systemTemp.createTemp('mmbd-test-');
    addTearDown(() => root.delete(recursive: true));
    final live = File('${root.path}/live.sqlite');
    final db = sqlite3.open(live.path);
    db.execute(
      'CREATE TABLE totals(value INTEGER); INSERT INTO totals VALUES(42);',
    );
    db.close();
    final attachments = Directory('${root.path}/attachments')..createSync();
    File('${attachments.path}/receipt.jpg').writeAsStringSync('receipt');
    final service = BackupService();
    final archive = await service.create(
      databaseFile: live,
      attachmentsDirectory: attachments,
      destinationDirectory: Directory('${root.path}/backups'),
      appVersion: '1.0',
      databaseVersion: 1,
      messSummary: const {'name': 'Test'},
    );
    final preview = await service.preview(archive, supportedDatabaseVersion: 1);
    expect(preview.attachmentCount, 1);
    live.writeAsStringSync('bad');
    await attachments.delete(recursive: true);
    final safety = await service.restore(
      archiveFile: archive,
      liveDatabaseFile: live,
      liveAttachmentsDirectory: attachments,
      supportedDatabaseVersion: 1,
    );
    expect(await safety.exists(), isTrue);
    final restored = sqlite3.open(live.path);
    expect(restored.select('SELECT value FROM totals').first['value'], 42);
    restored.close();
    expect(
      await File('${attachments.path}/receipt.jpg').readAsString(),
      'receipt',
    );
  });
  test('rejects malformed and incompatible archives', () async {
    final root = await Directory.systemTemp.createTemp('mmbd-test-');
    addTearDown(() => root.delete(recursive: true));
    final service = BackupService();
    final bad = File('${root.path}/bad.mmbd')..writeAsStringSync('no');
    await expectLater(
      service.preview(bad, supportedDatabaseVersion: 1),
      throwsFormatException,
    );
  });
}
