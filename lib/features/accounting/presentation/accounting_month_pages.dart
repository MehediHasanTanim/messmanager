// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../app/router/app_router.dart';
import '../../../core/database/database_provider.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/widgets/app_content.dart';
import '../domain/accounting_month_use_cases.dart';
import 'accounting_providers.dart';

class AccountingMonthSelectorPage extends ConsumerWidget {
  const AccountingMonthSelectorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final months = ref.watch(accountingMonthsProvider);
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        AppSectionHeader(
          title: 'হিসাবের মাস',
          actionLabel: 'নতুন মাস',
          onAction: () => context.push(AppRoutes.startMonth),
        ),
        const SizedBox(height: AppSpacing.sm),
        months.when(
          loading: () => const Center(
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.xl),
              child: CircularProgressIndicator(),
            ),
          ),
          error: (error, _) => Text('মাস লোড করা যায়নি: $error'),
          data: (items) => items.isEmpty
              ? const AppSummaryCard(
                  label: 'কোনো হিসাবের মাস নেই',
                  value: 'নতুন মাস শুরু করুন',
                  icon: Icons.calendar_month_outlined,
                )
              : Column(
                  children: [
                    for (final month in items)
                      Card(
                        child: ListTile(
                          leading: Icon(
                            month.status == 'closed'
                                ? Icons.lock_outline
                                : Icons.calendar_month_outlined,
                          ),
                          title: Text(_monthLabel(month.startDate)),
                          subtitle: Text(
                            month.status == 'closed' ? 'বন্ধ' : 'চলমান',
                          ),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () =>
                              context.push('${AppRoutes.months}/${month.id}'),
                        ),
                      ),
                  ],
                ),
        ),
      ],
    );
  }
}

class AccountingMonthDetailsPage extends ConsumerWidget {
  const AccountingMonthDetailsPage({required this.monthId, super.key});
  final String monthId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final database = ref.watch(appDatabaseProvider);
    return FutureBuilder(
      future: database.accountingMonthDao.findById(monthId),
      builder: (context, snapshot) {
        final month = snapshot.data;
        if (!snapshot.hasData)
          return const Center(child: CircularProgressIndicator());
        if (month == null)
          return const Center(child: Text('হিসাবের মাসটি পাওয়া যায়নি।'));
        if (month.status == 'closed') return ClosedMonthView(monthId: monthId);
        final summary = ref.watch(accountingMonthSummaryProvider(monthId));
        return ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            AppSectionHeader(title: _monthLabel(month.startDate)),
            const SizedBox(height: AppSpacing.sm),
            const AppStatusBadge(label: 'চলমান মাস', status: AppStatus.success),
            const SizedBox(height: AppSpacing.md),
            summary.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Text('সারাংশ পাওয়া যায়নি: $error'),
              data: (data) => Column(
                children: [
                  AppSummaryCard(
                    label: 'মোট মিল',
                    value: _units(data.mealUnits),
                    icon: Icons.restaurant_outlined,
                  ),
                  AppSummaryCard(
                    label: 'মিলের খরচ',
                    value: data.mealExpense.formattedBdt,
                    icon: Icons.shopping_basket_outlined,
                  ),
                  AppSummaryCard(
                    label: 'জমা',
                    value: data.deposits.formattedBdt,
                    icon: Icons.savings_outlined,
                  ),
                  AppSummaryCard(
                    label: 'সক্রিয় সদস্য',
                    value: '${data.activeMemberCount}',
                    icon: Icons.groups_outlined,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class StartAccountingMonthPage extends ConsumerStatefulWidget {
  const StartAccountingMonthPage({super.key});
  @override
  ConsumerState<StartAccountingMonthPage> createState() =>
      _StartAccountingMonthPageState();
}

class _StartAccountingMonthPageState
    extends ConsumerState<StartAccountingMonthPage> {
  DateTime _date = DateTime(DateTime.now().year, DateTime.now().month + 1);
  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    final current = ref.watch(currentAccountingMonthProvider);
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        const AppSectionHeader(title: 'নতুন হিসাবের মাস শুরু করুন'),
        const SizedBox(height: AppSpacing.md),
        current.when(
          loading: () => const LinearProgressIndicator(),
          error: (_, _) => const Text('বর্তমান মাস যাচাই করা যায়নি।'),
          data: (month) => month == null
              ? const AppStatusBadge(
                  label: 'নতুন মাস শুরু করা যাবে',
                  status: AppStatus.success,
                )
              : const AppStatusBadge(
                  label: 'আগের চলমান মাসটি আগে বন্ধ করুন',
                  status: AppStatus.warning,
                ),
        ),
        const SizedBox(height: AppSpacing.md),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('মাস'),
          subtitle: Text(_monthLabel(_date)),
          trailing: const Icon(Icons.calendar_today_outlined),
          onTap: () async {
            final selected = await showDatePicker(
              context: context,
              initialDate: _date,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              helpText: 'হিসাবের মাস বাছুন',
            );
            if (selected != null)
              setState(() => _date = DateTime(selected.year, selected.month));
          },
        ),
        const ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(Icons.people_outline),
          title: Text('সক্রিয় সদস্য অন্তর্ভুক্ত হবে'),
          subtitle: Text(
            'সদস্য তালিকা থেকে যেকোনো সময় সদস্যের অবস্থা বদলানো যাবে।',
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        FilledButton.icon(
          onPressed: _saving ? null : _start,
          icon: const Icon(Icons.play_arrow),
          label: Text(_saving ? 'শুরু হচ্ছে…' : 'মাস শুরু করুন'),
        ),
      ],
    );
  }

  Future<void> _start() async {
    setState(() => _saving = true);
    try {
      final mess = await ref.read(currentMessProvider.future);
      if (mess == null) throw StateError('আগে একটি মেস সেটআপ করুন।');
      await StartAccountingMonth(ref.read(appDatabaseProvider))(
        id: 'month-${DateTime.now().microsecondsSinceEpoch}',
        messId: mess.id,
        startDate: _date,
      );
      ref.invalidate(currentAccountingMonthProvider);
      ref.invalidate(accountingMonthsProvider);
      if (mounted) context.pop();
    } catch (error) {
      if (mounted)
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('$error')));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }
}

class ClosedMonthView extends ConsumerWidget {
  const ClosedMonthView({required this.monthId, super.key});
  final String monthId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(accountingMonthSummaryProvider(monthId));
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        const AppSectionHeader(title: 'বন্ধ হিসাবের মাস'),
        const SizedBox(height: AppSpacing.sm),
        const AppStatusBadge(
          label: 'বন্ধ — রেকর্ড শুধু দেখা যাবে',
          status: AppStatus.neutral,
        ),
        const SizedBox(height: AppSpacing.md),
        summary.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Text('সারাংশ পাওয়া যায়নি: $error'),
          data: (data) => Column(
            children: [
              AppSummaryCard(
                label: 'চূড়ান্ত মিল রেট',
                value: data.mealRate.formattedBdt,
                icon: Icons.restaurant_outlined,
              ),
              AppSummaryCard(
                label: 'মোট মিল',
                value: _units(data.mealUnits),
                icon: Icons.restaurant_menu_outlined,
              ),
              AppSummaryCard(
                label: 'মোট খরচ',
                value: data.totalExpense.formattedBdt,
                icon: Icons.receipt_long_outlined,
              ),
              const SizedBox(height: AppSpacing.md),
              OutlinedButton.icon(
                onPressed: () => context.go('${AppRoutes.settlement}/$monthId'),
                icon: const Icon(Icons.calculate_outlined),
                label: const Text('চূড়ান্ত নিষ্পত্তি দেখুন'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

String _monthLabel(DateTime date) => DateFormat('MMMM yyyy').format(date);
String _units(int value) =>
    (value / 100).toStringAsFixed(value % 100 == 0 ? 0 : 2);
