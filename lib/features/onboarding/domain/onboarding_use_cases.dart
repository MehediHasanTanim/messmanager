import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';

class MessDraft {
  const MessDraft({
    required this.name,
    required this.managerName,
    required this.languageCode,
    this.address,
    this.managerPhone,
  });

  final String name;
  final String managerName;
  final String languageCode;
  final String? address;
  final String? managerPhone;
}

class CreateMess {
  CreateMess(this._database);

  final AppDatabase _database;

  Future<void> call({required String id, required MessDraft draft}) {
    return _database.messDao.create(
      MessesCompanion.insert(
        id: id,
        name: draft.name.trim(),
        managerName: draft.managerName.trim(),
        address: Value(_nullableText(draft.address)),
        managerPhone: Value(_nullableText(draft.managerPhone)),
        defaultLanguage: Value(draft.languageCode),
      ),
    );
  }
}

class UpdateMess {
  UpdateMess(this._database);

  final AppDatabase _database;

  Future<bool> call(MessesCompanion mess) =>
      _database.update(_database.messes).replace(mess);
}

class CreateInitialAccountingMonth {
  CreateInitialAccountingMonth(this._database);

  final AppDatabase _database;

  Future<void> call({
    required String id,
    required String messId,
    required DateTime startDate,
  }) {
    return _database.accountingMonthDao.create(
      AccountingMonthsCompanion.insert(
        id: id,
        messId: messId,
        year: startDate.year,
        month: startDate.month,
        startDate: DateTime(startDate.year, startDate.month, 1),
      ),
    );
  }
}

class CompleteOnboarding {
  CompleteOnboarding(this._database);

  final AppDatabase _database;

  Future<void> call({
    required String messId,
    required String accountingMonthId,
    required MessDraft mess,
    required DateTime startDate,
  }) {
    return _database.transaction(() async {
      await _database
          .into(_database.messes)
          .insert(
            MessesCompanion.insert(
              id: messId,
              name: mess.name.trim(),
              managerName: mess.managerName.trim(),
              address: Value(_nullableText(mess.address)),
              managerPhone: Value(_nullableText(mess.managerPhone)),
              defaultLanguage: Value(mess.languageCode),
            ),
          );
      await _database
          .into(_database.accountingMonths)
          .insert(
            AccountingMonthsCompanion.insert(
              id: accountingMonthId,
              messId: messId,
              year: startDate.year,
              month: startDate.month,
              startDate: DateTime(startDate.year, startDate.month, 1),
            ),
          );
      await _database
          .into(_database.appSettings)
          .insert(
            AppSettingsCompanion.insert(
              id: 'onboarding-$messId',
              messId: Value(messId),
              settingKey: 'onboarding.complete',
              valueJson: 'true',
            ),
          );
    });
  }
}

String? _nullableText(String? value) {
  final trimmed = value?.trim();
  return trimmed == null || trimmed.isEmpty ? null : trimmed;
}
