import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mess_manager_bd/core/database/app_database.dart';
import 'package:mess_manager_bd/features/reports/domain/report_services.dart';

void main() {
  test('reports provide correct totals and CSV column integrity', () async {
    final db = AppDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    await db.messDao.create(
      MessesCompanion.insert(id: 'mess', name: 'মেস', managerName: 'Manager'),
    );
    await db.accountingMonthDao.create(
      AccountingMonthsCompanion.insert(
        id: 'month',
        messId: 'mess',
        year: 2026,
        month: 10,
        startDate: DateTime(2026, 10, 1),
      ),
    );
    await db.expenseDao.createCategory(
      ExpenseCategoriesCompanion.insert(
        id: 'category',
        messId: 'mess',
        name: 'Rice',
        type: 'mealExpense',
      ),
    );
    await db.expenseDao.createExpense(
      ExpensesCompanion.insert(
        id: 'expense',
        messId: 'mess',
        accountingMonthId: 'month',
        date: DateTime(2026, 10, 2),
        categoryId: 'category',
        amountMinor: 1250,
        affectsMealRate: const Value(true),
      ),
    );
    final report = await ReportService(db)
        .expenseReport(const ReportFilter(messId: 'mess', monthId: 'month'));
    expect(report.summary['Total'], '৳12.50');
    final csv = ReportExporter().csv(report).split('\n');
    expect(csv.first, 'Date,Category,Amount,Description');
    expect(csv, hasLength(2));
  });
  test(
    'text summaries support Bangla and English, and large data exports',
    () async {
      final report = ReportDocument(
        title: 'মাসিক সারসংক্ষেপ',
        monthLabel: '2026-10',
        columns: const ['Name', 'Amount'],
        rows: [
          for (var i = 0; i < 200; i++) ['সদস্য $i', '$i'],
        ],
        summary: const {'মোট': '৳10.00'},
        generatedAt: DateTime(2026),
      );
      final exporter = ReportExporter();
      expect(exporter.textSummary(report, bangla: true), contains('তৈরি:'));
      expect(exporter.textSummary(report), contains('Generated:'));
      expect(exporter.csv(report).split('\n'), hasLength(201));
    },
  );
}
