import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database_provider.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/widgets/app_content.dart';
import '../../accounting/presentation/accounting_providers.dart';
import '../domain/settlement_use_cases.dart';
import '../domain/settlement_validator.dart';

class SettlementHomePage extends ConsumerWidget {
  const SettlementHomePage({required this.monthId, super.key});
  final String monthId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mess = ref.watch(currentMessProvider);
    final month = ref.watch(currentAccountingMonthProvider);
    if (!mess.hasValue || !month.hasValue)
      return const Center(child: CircularProgressIndicator());
    final resolved = monthId == 'current' ? month.value?.id : monthId;
    if (mess.value == null || resolved == null)
      return const Center(child: Text('হিসাবের মাস পাওয়া যায়নি।'));
    return FutureBuilder<DraftSettlement>(
      future: GenerateDraftSettlement(ref.watch(appDatabaseProvider))(
        messId: mess.value!.id,
        monthId: resolved,
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return const Center(child: CircularProgressIndicator());
        final draft = snapshot.data!;
        final result = draft.result;
        return DefaultTabController(
          length: 4,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(
                  AppSpacing.md,
                  AppSpacing.md,
                  AppSpacing.md,
                  0,
                ),
                child: AppSectionHeader(title: 'ড্রাফট নিষ্পত্তি'),
              ),
              const TabBar(
                tabs: [
                  Tab(text: 'চেকলিস্ট'),
                  Tab(text: 'সারসংক্ষেপ'),
                  Tab(text: 'সদস্য'),
                  Tab(text: 'ইস্যু'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _Checklist(draft: draft),
                    ListView(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      children: [
                        AppSummaryCard(
                          label: 'মোট মিল',
                          value: (result.totalMealsScaled / 100)
                              .toStringAsFixed(2),
                          icon: Icons.restaurant_outlined,
                        ),
                        AppSummaryCard(
                          label: 'চূড়ান্ত মিল রেট',
                          value:
                              '৳${result.rate.displayTakaPerMeal.toStringAsFixed(2)}',
                          icon: Icons.calculate_outlined,
                        ),
                        AppSummaryCard(
                          label: 'রেকনসিলিয়েশন',
                          value: result.reconciliation.isReconciled
                              ? 'মিলেছে'
                              : 'মেলেনি',
                          icon: result.reconciliation.isReconciled
                              ? Icons.check_circle_outline
                              : Icons.error_outline,
                        ),
                      ],
                    ),
                    ListView.builder(
                      itemCount: result.members.length,
                      itemBuilder: (context, index) {
                        final row = result.members[index];
                        return Card(
                          child: ExpansionTile(
                            title: Text(row.memberId),
                            trailing: Text(_money(row.finalBalanceMinor)),
                            children: [
                              ListTile(
                                title: const Text('মিল খরচ'),
                                trailing: Text(_money(row.mealCostMinor)),
                              ),
                              ListTile(
                                title: const Text('ইউটিলিটি / শেয়ার্ড'),
                                trailing: Text(
                                  '${_money(row.utilityMinor)} / ${_money(row.sharedExpenseMinor)}',
                                ),
                              ),
                              ListTile(
                                title: const Text('মোট প্রদেয় / ক্রেডিট'),
                                trailing: Text(
                                  '${_money(row.totalPayableMinor)} / ${_money(row.totalCreditMinor)}',
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    ListView(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      children: draft.issues.isEmpty
                          ? const [
                              ListTile(
                                leading: Icon(Icons.check_circle_outline),
                                title: Text('কোনো ইস্যু নেই।'),
                              ),
                            ]
                          : draft.issues
                                .map(
                                  (issue) => ListTile(
                                    leading: Icon(
                                      issue.severity ==
                                              SettlementIssueSeverity.blocking
                                          ? Icons.error_outline
                                          : Icons.warning_amber_outlined,
                                    ),
                                    title: Text(
                                      issue.severity ==
                                              SettlementIssueSeverity.blocking
                                          ? 'ব্লকিং'
                                          : 'সতর্কতা',
                                    ),
                                    subtitle: Text(issue.message),
                                  ),
                                )
                                .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Checklist extends StatelessWidget {
  const _Checklist({required this.draft});
  final DraftSettlement draft;
  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(AppSpacing.md),
    children: [
      ListTile(
        leading: Icon(
          draft.canGenerate ? Icons.check_circle_outline : Icons.error_outline,
        ),
        title: Text(
          draft.canGenerate ? 'ড্রাফট তৈরি করা যাবে' : 'ড্রাফট তৈরি আটকে আছে',
        ),
        subtitle: Text(
          draft.canGenerate
              ? 'সব ব্লকিং যাচাই পাস করেছে।'
              : 'ব্লকিং ইস্যুগুলো সমাধান করুন।',
        ),
      ),
      ListTile(
        leading: Icon(
          draft.result.reconciliation.isReconciled
              ? Icons.check_circle_outline
              : Icons.error_outline,
        ),
        title: const Text('রেকনসিলিয়েশন'),
        subtitle: Text(
          draft.result.reconciliation.isReconciled
              ? 'মিল, ইউটিলিটি, বিশেষ মিল ও শেয়ার্ড খরচ মিলে গেছে।'
              : 'অ্যালোকেশন অমিল আছে।',
        ),
      ),
    ],
  );
}

String _money(int minor) =>
    '${minor < 0 ? '-' : ''}৳${(minor.abs() / 100).toStringAsFixed(2)}';
