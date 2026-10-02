import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';

class SettingsService {
  SettingsService(this._db);
  final AppDatabase _db;
  Future<void> save(String messId, String key, Object value) =>
      _db.settingsDao.saveSetting(
        AppSettingsCompanion(
          id: Value('setting-$messId-$key'),
          messId: Value(messId),
          settingKey: Value(key),
          valueJson: Value(jsonEncode(value)),
          updatedAt: Value(DateTime.now()),
        ),
      );
  Future<T?> read<T>(String messId, String key) async {
    final row = await _db.settingsDao.findSetting(messId, key);
    return row == null ? null : jsonDecode(row.valueJson) as T?;
  }
}

class AuditActivity {
  const AuditActivity({
    required this.id,
    required this.action,
    required this.entityType,
    required this.timestamp,
    required this.summary,
  });
  final String id, action, entityType, summary;
  final DateTime timestamp;
}

class AuditService {
  AuditService(this._db);
  final AppDatabase _db;
  Future<void> record({
    required String messId,
    required String entityType,
    required String entityId,
    required String action,
  }) => _db.settingsDao.recordAudit(
    AuditEntriesCompanion.insert(
      id: 'audit-${DateTime.now().microsecondsSinceEpoch}',
      messId: messId,
      entityType: entityType,
      entityId: entityId,
      action: action,
    ),
  );
  Future<List<AuditActivity>> list(String messId) async {
    final rows =
        await (_db.select(_db.auditEntries)
              ..where((r) => r.messId.equals(messId))
              ..orderBy([(r) => OrderingTerm.desc(r.timestamp)]))
            .get();
    return [
      for (final r in rows)
        AuditActivity(
          id: r.id,
          action: r.action,
          entityType: r.entityType,
          timestamp: r.timestamp,
          summary: '${r.action} ${r.entityType}',
        ),
    ];
  }
}
