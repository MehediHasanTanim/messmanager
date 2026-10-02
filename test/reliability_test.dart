import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mess_manager_bd/core/database/app_database.dart';
import 'package:mess_manager_bd/core/reliability/maintenance_service.dart';

void main() {
  test(
    'database health, temporary cleanup and backup retention are safe',
    () async {
      final db = AppDatabase.forTesting(NativeDatabase.memory());
      addTearDown(db.close);
      final service = MaintenanceService(db);
      expect((await service.checkDatabase()).healthy, isTrue);
      final dir = await Directory.systemTemp.createTemp('mmbd-cleanup-');
      addTearDown(() => dir.delete(recursive: true));
      final old = File('${dir.path}/old.csv')..writeAsStringSync('x');
      await old.setLastModified(
        DateTime.now().subtract(const Duration(days: 2)),
      );
      File('${dir.path}/new.pdf').writeAsStringSync('x');
      expect(await service.cleanupTemporaryReports(dir), 1);
      for (var i = 0; i < 7; i++) {
        final file = File('${dir.path}/$i.mmbd')..writeAsStringSync('x');
        await file.setLastModified(
          DateTime.now().subtract(Duration(minutes: i)),
        );
      }
      expect(await service.cleanupOldBackups(dir, keep: 5), 2);
    },
  );
}
