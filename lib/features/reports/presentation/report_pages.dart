import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../app/router/app_router.dart';
import '../../../core/database/database_provider.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/widgets/app_content.dart';
import '../../accounting/presentation/accounting_providers.dart';
import '../domain/report_services.dart';

class ReportsHomePage extends StatelessWidget {
  const ReportsHomePage({super.key});
  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(AppSpacing.md),
    children: [
      const AppSectionHeader(title: 'রিপোর্ট'),
      for (final kind in ReportKind.values)
        Card(
          child: ListTile(
            leading: const Icon(Icons.description_outlined),
            title: Text(_label(kind)),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go('${AppRoutes.reports}/${kind.name}'),
          ),
        ),
    ],
  );
}

class ReportPreviewPage extends ConsumerStatefulWidget {
  const ReportPreviewPage({required this.kind, super.key});
  final ReportKind kind;

  @override
  ConsumerState<ReportPreviewPage> createState() => _ReportPreviewPageState();
}

class _ReportPreviewPageState extends ConsumerState<ReportPreviewPage> {
  String? _memberId;
  String? _categoryId;
  String? _type;
  DateTime? _from;
  DateTime? _to;

  @override
  Widget build(BuildContext context) {
    final mess = ref.watch(currentMessProvider);
    final month = ref.watch(currentAccountingMonthProvider);
    if (!mess.hasValue || !month.hasValue)
      return const Center(child: CircularProgressIndicator());
    if (mess.value == null || month.value == null)
      return const Center(child: Text('চলমান হিসাবের মাস নেই।'));
    final filter = ReportFilter(
      messId: mess.value!.id,
      monthId: month.value!.id,
      memberId: _memberId,
      categoryId: _categoryId,
      type: _type,
      from: _from,
      to: _to,
    );
    return FutureBuilder<ReportDocument>(
      future: ReportService(ref.watch(appDatabaseProvider))
          .generate(widget.kind, filter),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return const Center(child: CircularProgressIndicator());
        final report = snapshot.data!;
        return ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            AppSectionHeader(
              title: report.title,
              actionLabel: 'শেয়ার',
              onAction: () => _share(context, report),
            ),
            OutlinedButton.icon(
              icon: const Icon(Icons.filter_alt_outlined),
              label: const Text('ফিল্টার'),
              onPressed: () async {
                final next = await showModalBottomSheet<_ReportUiFilter>(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) => _ReportFilterSheet(
                    initial: _ReportUiFilter(
                      memberId: _memberId,
                      categoryId: _categoryId,
                      type: _type,
                      from: _from,
                      to: _to,
                    ),
                  ),
                );
                if (next != null && mounted)
                  setState(() {
                    _memberId = next.memberId;
                    _categoryId = next.categoryId;
                    _type = next.type;
                    _from = next.from;
                    _to = next.to;
                  });
              },
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: report.summary.entries
                  .map(
                    (entry) => AppSummaryCard(
                      label: entry.key,
                      value: entry.value,
                      icon: Icons.summarize_outlined,
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  for (final c in report.columns) DataColumn(label: Text(c)),
                ],
                rows: [
                  for (final row in report.rows)
                    DataRow(
                      cells: [for (final cell in row) DataCell(Text(cell))],
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: () => _share(context, report, pdf: true),
              icon: const Icon(Icons.picture_as_pdf_outlined),
              label: const Text('PDF এক্সপোর্ট / শেয়ার'),
            ),
            OutlinedButton.icon(
              onPressed: () => _share(context, report),
              icon: const Icon(Icons.table_chart_outlined),
              label: const Text('CSV শেয়ার'),
            ),
          ],
        );
      },
    );
  }
}

class _ReportUiFilter {
  const _ReportUiFilter({
    this.memberId,
    this.categoryId,
    this.type,
    this.from,
    this.to,
  });
  final String? memberId, categoryId, type;
  final DateTime? from, to;
}

class _ReportFilterSheet extends StatefulWidget {
  const _ReportFilterSheet({required this.initial});
  final _ReportUiFilter initial;
  @override
  State<_ReportFilterSheet> createState() => _ReportFilterSheetState();
}

class _ReportFilterSheetState extends State<_ReportFilterSheet> {
  late final _member = TextEditingController(text: widget.initial.memberId);
  late final _category = TextEditingController(text: widget.initial.categoryId);
  late final _type = TextEditingController(text: widget.initial.type);
  DateTime? _from, _to;
  @override
  void initState() {
    super.initState();
    _from = widget.initial.from;
    _to = widget.initial.to;
  }

  @override
  void dispose() {
    _member.dispose();
    _category.dispose();
    _type.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.fromLTRB(
      16,
      16,
      16,
      16 + MediaQuery.viewInsetsOf(context).bottom,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('রিপোর্ট ফিল্টার'),
        TextField(
          controller: _member,
          decoration: const InputDecoration(labelText: 'Member ID'),
        ),
        TextField(
          controller: _category,
          decoration: const InputDecoration(labelText: 'Category ID'),
        ),
        TextField(
          controller: _type,
          decoration: const InputDecoration(labelText: 'Type / payment method'),
        ),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    initialDate: _from ?? DateTime.now(),
                  );
                  if (date != null) setState(() => _from = date);
                },
                child: Text(
                  _from == null
                      ? 'From date'
                      : 'From ${_from!.toIso8601String().substring(0, 10)}',
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    initialDate: _to ?? DateTime.now(),
                  );
                  if (date != null) setState(() => _to = date);
                },
                child: Text(
                  _to == null
                      ? 'To date'
                      : 'To ${_to!.toIso8601String().substring(0, 10)}',
                ),
              ),
            ),
          ],
        ),
        FilledButton(
          onPressed: () => Navigator.pop(
            context,
            _ReportUiFilter(
              memberId: _empty(_member.text),
              categoryId: _empty(_category.text),
              type: _empty(_type.text),
              from: _from,
              to: _to,
            ),
          ),
          child: const Text('প্রয়োগ করুন'),
        ),
      ],
    ),
  );
}

String? _empty(String value) => value.trim().isEmpty ? null : value.trim();

Future<void> _share(
  BuildContext context,
  ReportDocument report, {
  bool pdf = false,
}) async {
  final dir = await getTemporaryDirectory();
  final exporter = ReportExporter();
  final file = File(
    '${dir.path}/${report.title.replaceAll(' ', '_')}.${pdf ? 'pdf' : 'csv'}',
  );
  await file.writeAsBytes(
    pdf ? await exporter.pdf(report) : exporter.csv(report).codeUnits,
  );
  await SharePlus.instance.share(
    ShareParams(
      files: [XFile(file.path)],
      text: exporter.textSummary(report, bangla: true),
      subject: report.title,
    ),
  );
}

String _label(ReportKind kind) => switch (kind) {
  ReportKind.monthly => 'মাসিক সারসংক্ষেপ',
  ReportKind.member => 'সদস্য রিপোর্ট',
  ReportKind.meal => 'মিল রিপোর্ট',
  ReportKind.expense => 'খরচ রিপোর্ট',
  ReportKind.deposit => 'জমা রিপোর্ট',
  ReportKind.utility => 'ইউটিলিটি রিপোর্ট',
  ReportKind.guestMeal => 'অতিথি মিল রিপোর্ট',
  ReportKind.specialMeal => 'বিশেষ মিল রিপোর্ট',
};
