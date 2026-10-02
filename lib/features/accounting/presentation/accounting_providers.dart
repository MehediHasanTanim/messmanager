import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/database_provider.dart';
import '../domain/accounting_month_models.dart';
import '../domain/accounting_month_use_cases.dart';

final currentMessProvider = FutureProvider<MessesData?>((ref) async {
  final database = ref.watch(appDatabaseProvider);
  return (database.select(database.messes)..limit(1)).getSingleOrNull();
});

final currentAccountingMonthProvider = FutureProvider<AccountingMonth?>((
  ref,
) async {
  final mess = await ref.watch(currentMessProvider.future);
  if (mess == null) return null;
  return GetCurrentAccountingMonth(ref.watch(appDatabaseProvider))(mess.id);
});

final accountingMonthsProvider = StreamProvider<List<AccountingMonth>>((
  ref,
) async* {
  final mess = await ref.watch(currentMessProvider.future);
  if (mess == null) {
    yield const [];
    return;
  }
  yield* ListAccountingMonths(ref.watch(appDatabaseProvider))(mess.id);
});

final accountingMonthSummaryProvider =
    FutureProvider.family<AccountingMonthSummary, String>((ref, monthId) async {
      final mess = await ref.watch(currentMessProvider.future);
      if (mess == null) throw StateError('No mess is configured.');
      return GetAccountingMonthSummary(ref.watch(appDatabaseProvider))(
        messId: mess.id,
        monthId: monthId,
      );
    });
