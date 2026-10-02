import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mess_manager_bd/core/database/app_database.dart';
import 'package:mess_manager_bd/features/settings/domain/settings_audit_service.dart';

void main() {
  test('settings persist and audit UI model hides raw JSON', () async {
    final db = AppDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    await db.messDao.create(
      MessesCompanion.insert(id: 'mess', name: 'Test', managerName: 'Manager'),
    );
    final settings = SettingsService(db);
    await settings.save('mess', 'theme', 'dark');
    expect(await settings.read<String>('mess', 'theme'), 'dark');
    final audit = AuditService(db);
    await audit.record(
      messId: 'mess',
      entityType: 'member',
      entityId: 'member-1',
      action: 'create',
    );
    final activity = (await audit.list('mess')).single;
    expect(activity.summary, 'create member');
  });
}
