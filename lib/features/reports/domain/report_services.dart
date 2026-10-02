import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../core/database/app_database.dart';
import '../../settlement/domain/settlement_use_cases.dart';

enum ReportKind {
  monthly,
  member,
  meal,
  expense,
  deposit,
  utility,
  guestMeal,
  specialMeal,
}

class ReportFilter {
  const ReportFilter({
    required this.messId,
    required this.monthId,
    this.memberId,
    this.categoryId,
    this.from,
    this.to,
    this.type,
  });
  final String messId, monthId;
  final String? memberId, categoryId, type;
  final DateTime? from, to;
}

class ReportDocument {
  const ReportDocument({
    required this.title,
    required this.monthLabel,
    required this.columns,
    required this.rows,
    required this.summary,
    required this.generatedAt,
  });
  final String title, monthLabel;
  final List<String> columns;
  final List<List<String>> rows;
  final Map<String, String> summary;
  final DateTime generatedAt;
}

class ReportService {
  ReportService(this._database);
  final AppDatabase _database;
  Future<ReportDocument> generate(ReportKind kind, ReportFilter filter) =>
      switch (kind) {
        ReportKind.monthly => monthlySummary(filter),
        ReportKind.member => memberReport(filter),
        ReportKind.meal => mealReport(filter),
        ReportKind.expense => expenseReport(filter),
        ReportKind.deposit => depositReport(filter),
        ReportKind.utility => utilityReport(filter),
        ReportKind.guestMeal => guestMealReport(filter),
        ReportKind.specialMeal => specialMealReport(filter),
      };
  Future<ReportDocument> monthlySummary(ReportFilter filter) async {
    final snapshot = await _database.settlementDao.forMonth(filter.monthId);
    if (snapshot != null) {
      final rows = await (_database.select(
        _database.memberSettlements,
      )..where((r) => r.settlementId.equals(snapshot.id))).get();
      return _doc(
        'Monthly Summary (closed snapshot)',
        filter,
        ['Member', 'Meals', 'Payable', 'Credit', 'Balance'],
        [
          for (final r in rows)
            [
              r.memberId,
              _units(r.mealUnits),
              _money(r.totalPayableMinor),
              _money(r.totalCreditMinor),
              _money(r.finalBalanceMinor),
            ],
        ],
        {
          'Meal expense': _money(snapshot.totalMealExpenseMinor),
          'Shared expense': _money(snapshot.totalSharedExpenseMinor),
          'Deposits': _money(snapshot.totalDepositMinor),
          'Final rate': '${snapshot.mealRateScaled} internal',
        },
      );
    }
    final draft = await GenerateDraftSettlement(_database)(
      messId: filter.messId,
      monthId: filter.monthId,
    );
    return _doc(
      'Monthly Summary (draft)',
      filter,
      ['Member', 'Meals', 'Payable', 'Credit', 'Balance'],
      [
        for (final r in draft.result.members)
          [
            r.memberId,
            _units(r.mealUnitsScaled),
            _money(r.totalPayableMinor),
            _money(r.totalCreditMinor),
            _money(r.finalBalanceMinor),
          ],
      ],
      {
        'Meal expense': _money(draft.input.mealExpenseMinor),
        'Shared expense': _money(draft.input.sharedExpenseTotalMinor),
        'Status': draft.canGenerate ? 'Ready' : 'Has issues',
      },
    );
  }

  Future<ReportDocument> memberReport(ReportFilter filter) async {
    final base = await monthlySummary(filter);
    final rows = filter.memberId == null
        ? base.rows
        : base.rows.where((r) => r.first == filter.memberId).toList();
    return ReportDocument(
      title: 'Member Report',
      monthLabel: base.monthLabel,
      columns: base.columns,
      rows: rows,
      summary: base.summary,
      generatedAt: base.generatedAt,
    );
  }

  Future<ReportDocument> mealReport(ReportFilter f) async {
    final rows = await _database.mealDao.forMonth(f.monthId);
    final filtered = rows.where(
      (r) =>
          _date(r.mealDate, f) &&
          (f.memberId == null || r.memberId == f.memberId),
    );
    return _doc(
      'Meal Report',
      f,
      ['Date', 'Member', 'Units'],
      [
        for (final r in filtered)
          [_day(r.mealDate), r.memberId, _units(r.totalUnits)],
      ],
      {'Total meals': _units(rows.fold(0, (s, r) => s + r.totalUnits))},
    );
  }

  Future<ReportDocument> expenseReport(ReportFilter f) async {
    final rows = await _database.expenseDao.expensesForMonth(f.monthId);
    final filtered = rows.where(
      (r) =>
          _date(r.date, f) &&
          (f.categoryId == null || r.categoryId == f.categoryId),
    );
    return _doc(
      'Expense Report',
      f,
      ['Date', 'Category', 'Amount', 'Description'],
      [
        for (final r in filtered)
          [
            _day(r.date),
            r.categoryId,
            _money(r.amountMinor),
            r.description ?? '',
          ],
      ],
      {'Total': _money(filtered.fold(0, (s, r) => s + r.amountMinor))},
    );
  }

  Future<ReportDocument> depositReport(ReportFilter f) async {
    final rows = (await _database.depositDao.depositsForMonth(f.monthId)).where(
      (r) =>
          _date(r.date, f) &&
          (f.memberId == null || r.memberId == f.memberId) &&
          (f.type == null || r.paymentMethod == f.type),
    );
    return _doc(
      'Deposit Report',
      f,
      ['Date', 'Member', 'Method', 'Amount'],
      [
        for (final r in rows)
          [_day(r.date), r.memberId, r.paymentMethod, _money(r.amountMinor)],
      ],
      {'Total': _money(rows.fold(0, (s, r) => s + r.amountMinor))},
    );
  }

  Future<ReportDocument> utilityReport(ReportFilter f) async {
    final rows = (await _database.utilityDao.billsForMonth(f.monthId)).where(
      (r) =>
          _date(r.billingMonth, f) && (f.type == null || r.billType == f.type),
    );
    return _doc(
      'Utility Report',
      f,
      ['Bill', 'Date', 'Status', 'Amount'],
      [
        for (final r in rows)
          [r.billType, _day(r.billingMonth), r.status, _money(r.amountMinor)],
      ],
      {'Total': _money(rows.fold(0, (s, r) => s + r.amountMinor))},
    );
  }

  Future<ReportDocument> guestMealReport(ReportFilter f) async {
    final rows = (await _database.mealDao.guestMealsForMonth(f.monthId)).where(
      (r) =>
          _date(r.mealDate, f) &&
          (f.memberId == null || r.hostMemberId == f.memberId),
    );
    return _doc(
      'Guest Meal Report',
      f,
      ['Date', 'Host', 'Units', 'Charge mode'],
      [
        for (final r in rows)
          [
            _day(r.mealDate),
            r.hostMemberId,
            _units(r.mealUnits),
            r.chargeMethod,
          ],
      ],
      {'Guest meals': '${rows.length}'},
    );
  }

  Future<ReportDocument> specialMealReport(ReportFilter f) async {
    final rows = (await _database.mealDao.specialMealsForMonth(f.monthId))
        .where((r) => _date(r.date, f));
    return _doc(
      'Special Meal Report',
      f,
      ['Date', 'Title', 'Amount', 'Distribution'],
      [
        for (final r in rows)
          [
            _day(r.date),
            r.title,
            _money(r.totalCostMinor),
            r.distributionMethod,
          ],
      ],
      {'Total': _money(rows.fold(0, (s, r) => s + r.totalCostMinor))},
    );
  }

  ReportDocument _doc(
    String title,
    ReportFilter f,
    List<String> columns,
    List<List<String>> rows,
    Map<String, String> summary,
  ) => ReportDocument(
    title: title,
    monthLabel: f.monthId,
    columns: columns,
    rows: rows,
    summary: summary,
    generatedAt: DateTime.now(),
  );
}

class ReportExporter {
  String csv(ReportDocument report) =>
      const ListToCsvConverter().convert([report.columns, ...report.rows]);
  String textSummary(ReportDocument report, {bool bangla = false}) {
    final totals = report.summary.entries
        .map((e) => '${e.key}: ${e.value}')
        .join(' | ');
    return bangla
        ? '${report.title} — মাস: ${report.monthLabel}\n$totals\nতৈরি: ${report.generatedAt.toIso8601String()}'
        : '${report.title} — Month: ${report.monthLabel}\n$totals\nGenerated: ${report.generatedAt.toIso8601String()}';
  }

  Future<List<int>> pdf(
    ReportDocument report, {
    String messName = 'Mess Manager BD',
  }) async {
    // Noto Sans Bengali is embedded in every PDF, so Bangla headers, member
    // names, and compact summaries are portable across Android/iOS viewers.
    final font = await PdfGoogleFonts.notoSansBengaliRegular().timeout(
      const Duration(seconds: 3),
      onTimeout: pw.Font.helvetica,
    );
    final bold = await PdfGoogleFonts.notoSansBengaliBold().timeout(
      const Duration(seconds: 3),
      onTimeout: pw.Font.helveticaBold,
    );
    final doc = pw.Document(
      theme: pw.ThemeData.withFont(base: font, bold: bold),
    );
    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          pw.Header(level: 0, child: pw.Text(messName)),
          pw.Text(report.title),
          pw.Text('Accounting month: ${report.monthLabel}'),
          pw.SizedBox(height: 8),
          pw.Text(
            report.summary.entries
                .map((e) => '${e.key}: ${e.value}')
                .join('   '),
          ),
          pw.SizedBox(height: 12),
          pw.TableHelper.fromTextArray(
            headers: report.columns,
            data: report.rows,
          ),
          pw.SizedBox(height: 12),
          pw.Text('Generated: ${report.generatedAt.toIso8601String()}'),
        ],
      ),
    );
    return doc.save();
  }
}

bool _date(DateTime value, ReportFilter f) =>
    (f.from == null || !value.isBefore(f.from!)) &&
    (f.to == null || !value.isAfter(f.to!.add(const Duration(days: 1))));
String _day(DateTime date) =>
    '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
String _money(int value) =>
    '${value < 0 ? '-' : ''}৳${(value.abs() / 100).toStringAsFixed(2)}';
String _units(int units) => (units / 100).toStringAsFixed(2);

class ListToCsvConverter {
  const ListToCsvConverter();
  String convert(List<List<String>> rows) =>
      rows.map((row) => row.map(_escape).join(',')).join('\n');
  String _escape(String value) => value.contains(RegExp('[,\n"]'))
      ? '"${value.replaceAll('"', '""')}"'
      : value;
}
