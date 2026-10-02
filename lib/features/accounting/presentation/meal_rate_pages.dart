import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database_provider.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/widgets/app_content.dart';
import 'accounting_providers.dart';
import '../domain/dashboard_use_cases.dart';

class CurrentMealRatePage extends ConsumerWidget {
  const CurrentMealRatePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mess = ref.watch(currentMessProvider);
    final month = ref.watch(currentAccountingMonthProvider);
    if (!mess.hasValue || !month.hasValue)
      return const Center(child: CircularProgressIndicator());
    if (mess.value == null || month.value == null)
      return const Center(child: Text('চলমান হিসাবের মাস নেই।'));
    return FutureBuilder<DashboardSummary>(
      future: GetDashboardSummary(ref.watch(appDatabaseProvider))(
        messId: mess.value!.id,
        monthId: month.value!.id,
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return const Center(child: CircularProgressIndicator());
        final data = snapshot.data!;
        return ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            const AppSectionHeader(title: 'বর্তমান মিল রেট'),
            AppSummaryCard(
              label: 'প্রতি মিল',
              value: '৳${data.rate.displayTakaPerMeal.toStringAsFixed(2)}',
              icon: Icons.restaurant_outlined,
            ),
            AppSummaryCard(
              label: 'মিলের খরচ',
              value: _money(data.mealExpenseMinor),
              icon: Icons.shopping_basket_outlined,
            ),
            AppSummaryCard(
              label: 'মোট মিল',
              value: (data.monthUnits / 100).toStringAsFixed(2),
              icon: Icons.pie_chart_outline,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'হিসাবের ব্যাখ্যা',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Text(
              'খরচ ও স্কেল করা মিল ইউনিট দিয়ে রেট একবার হিসাব করা হয়। সদস্যভিত্তিক ভাগে অবশিষ্ট পয়সা স্থির সদস্য-ID ক্রমে দেওয়া হয়, তাই মোট সবসময় মিলের খরচের সঙ্গে মিলে যায়।',
            ),
          ],
        );
      },
    );
  }
}

String _money(int value) => '৳${(value / 100).toStringAsFixed(2)}';
