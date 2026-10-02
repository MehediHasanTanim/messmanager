import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/providers/app_providers.dart';
import '../../../app/router/app_router.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/database/database_provider.dart';
import '../../../core/widgets/app_content.dart';
import '../../accounting/presentation/accounting_providers.dart';
import '../../accounting/domain/dashboard_use_cases.dart';

class FoundationPage extends StatelessWidget {
  const FoundationPage({
    required this.title,
    required this.icon,
    required this.description,
    super.key,
  });

  final String title;
  final IconData icon;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        AppSectionHeader(title: title),
        const SizedBox(height: AppSpacing.md),
        AppSummaryCard(label: 'Foundation route', value: title, icon: icon),
        const SizedBox(height: AppSpacing.md),
        Text(description, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}

class HomeFoundationPage extends ConsumerWidget {
  const HomeFoundationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mess = ref.watch(currentMessProvider);
    final month = ref.watch(currentAccountingMonthProvider);
    if (!mess.hasValue ||
        !month.hasValue ||
        mess.value == null ||
        month.value == null) {
      return ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: const [
          AppSectionHeader(title: 'হিসাবের মাস'),
          SizedBox(height: AppSpacing.md),
          AppSummaryCard(
            label: 'বর্তমান মিল রেট',
            value: '৳0.00',
            icon: Icons.restaurant_outlined,
          ),
          SizedBox(height: AppSpacing.md),
          AppSummaryCard(
            label: 'আজকের খাবার',
            value: 'কোনো এন্ট্রি নেই',
            icon: Icons.today_outlined,
            color: AppColors.info,
          ),
        ],
      );
    }
    return FutureBuilder<DashboardSummary>(
      future: GetDashboardSummary(ref.watch(appDatabaseProvider))(
        messId: mess.value!.id,
        monthId: month.value!.id,
      ),
      builder: (context, snapshot) => ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          AppSectionHeader(
            title: '${month.value!.month}/${month.value!.year}',
            actionLabel: 'পরিবর্তন',
            onAction: () => context.push(AppRoutes.months),
          ),
          const SizedBox(height: AppSpacing.md),
          AppSummaryCard(
            label: 'বর্তমান মিল রেট',
            value: snapshot.hasData
                ? '৳${snapshot.data!.rate.displayTakaPerMeal.toStringAsFixed(2)}'
                : '…',
            icon: Icons.restaurant_outlined,
          ),
          const SizedBox(height: AppSpacing.md),
          AppSummaryCard(
            label: 'আজকের খাবার',
            value: snapshot.hasData
                ? '${(snapshot.data!.todayUnits / 100).toStringAsFixed(2)} মিল'
                : '…',
            icon: Icons.today_outlined,
            color: AppColors.info,
          ),
          if (snapshot.hasData) ...[
            AppSummaryCard(
              label: 'সক্রিয় সদস্য',
              value: '${snapshot.data!.activeMembers}',
              icon: Icons.people_outline,
            ),
            AppSummaryCard(
              label: 'মাসের জমা',
              value:
                  '৳${(snapshot.data!.depositMinor / 100).toStringAsFixed(2)}',
              icon: Icons.account_balance_wallet_outlined,
            ),
            AppSummaryCard(
              label: 'ইউটিলিটি বাকি/মোট',
              value:
                  '৳${(snapshot.data!.utilityMinor / 100).toStringAsFixed(2)}',
              icon: Icons.bolt_outlined,
            ),
          ],
        ],
      ),
    );
  }
}

class MoreFoundationPage extends StatelessWidget {
  const MoreFoundationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        const AppSectionHeader(title: 'আরও'),
        const SizedBox(height: AppSpacing.sm),
        _MoreRouteTile(
          label: 'ইউটিলিটি বিল',
          icon: Icons.bolt_outlined,
          onTap: () => context.go(AppRoutes.utilityBills),
        ),
        _MoreRouteTile(
          label: 'জমা',
          icon: Icons.account_balance_wallet_outlined,
          onTap: () => context.go(AppRoutes.deposits),
        ),
        _MoreRouteTile(
          label: 'সমন্বয়',
          icon: Icons.tune_outlined,
          onTap: () => context.go(AppRoutes.adjustments),
        ),
        _MoreRouteTile(
          label: 'সেটিংস',
          icon: Icons.settings_outlined,
          onTap: () => context.go(AppRoutes.settings),
        ),
        _MoreRouteTile(
          label: 'হিসাব নিষ্পত্তি',
          icon: Icons.calculate_outlined,
          onTap: () => context.go('${AppRoutes.settlement}/current'),
        ),
        _MoreRouteTile(
          label: 'রিপোর্ট',
          icon: Icons.bar_chart_outlined,
          onTap: () => context.go(AppRoutes.reports),
        ),
      ],
    );
  }
}

class SettingsFoundationPage extends ConsumerWidget {
  const SettingsFoundationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        const AppSectionHeader(title: 'দেখন সেটিংস'),
        const SizedBox(height: AppSpacing.md),
        Text('থিম', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: AppSpacing.sm),
        SegmentedButton<ThemeMode>(
          segments: const [
            ButtonSegment(value: ThemeMode.system, label: Text('সিস্টেম')),
            ButtonSegment(value: ThemeMode.light, label: Text('আলো')),
            ButtonSegment(value: ThemeMode.dark, label: Text('অন্ধকার')),
          ],
          selected: {themeMode},
          onSelectionChanged: (selection) {
            ref.read(themeModeProvider.notifier).setMode(selection.first);
          },
        ),
      ],
    );
  }
}

class _MoreRouteTile extends StatelessWidget {
  const _MoreRouteTile({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(label),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
