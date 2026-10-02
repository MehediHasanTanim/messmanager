import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/widgets/app_scaffold.dart';
import '../../core/widgets/app_states.dart';
import '../../features/foundation/presentation/foundation_page.dart';
import '../providers/app_providers.dart';

abstract final class AppRoutes {
  static const root = '/';
  static const setup = '/setup/welcome';
  static const lock = '/lock';
  static const home = '/home';
  static const meals = '/meals';
  static const expenses = '/expenses';
  static const members = '/members';
  static const more = '/more';
  static const settings = '/more/settings';
  static const settlement = '/more/settlement';
  static const reports = '/more/reports';
}

final appRouterProvider = Provider<GoRouter>((ref) {
  final accessState = ref.watch(appAccessStateProvider);

  final router = GoRouter(
    initialLocation: AppRoutes.home,
    redirect: (context, state) {
      final path = state.uri.path;
      final onSetupRoute = path.startsWith('/setup');
      final onLockRoute = path == AppRoutes.lock;

      if (accessState.needsSetup) {
        return onSetupRoute ? null : AppRoutes.setup;
      }
      if (accessState.isLocked) {
        return onLockRoute ? null : AppRoutes.lock;
      }
      if (onSetupRoute || onLockRoute || path == AppRoutes.root) {
        return AppRoutes.home;
      }
      return null;
    },
    errorBuilder: (context, state) => AppScaffold(
      title: 'পৃষ্ঠা পাওয়া যায়নি',
      showBackButton: true,
      child: AppErrorState(
        title: 'পৃষ্ঠা পাওয়া যায়নি',
        message: 'এই ঠিকানাটির জন্য কোনো স্ক্রিন নেই।',
        actionLabel: 'হোমে যান',
        onAction: () => context.go(AppRoutes.home),
      ),
    ),
    routes: [
      GoRoute(
        path: AppRoutes.setup,
        name: 'setup-welcome',
        builder: (context, state) => const FoundationPage(
          title: 'মেস সেটআপ',
          icon: Icons.home_work_outlined,
          description: 'Setup flow will be implemented in Phase 3.',
        ),
      ),
      GoRoute(
        path: AppRoutes.lock,
        name: 'app-lock',
        builder: (context, state) => const FoundationPage(
          title: 'অ্যাপ লক',
          icon: Icons.lock_outline,
          description: 'Local app lock will be implemented in Phase 3.',
        ),
      ),
      ShellRoute(
        builder: (context, state, child) =>
            AppShell(currentPath: state.uri.path, child: child),
        routes: [
          GoRoute(
            path: AppRoutes.home,
            name: 'home',
            builder: (context, state) => const HomeFoundationPage(),
          ),
          GoRoute(
            path: AppRoutes.meals,
            name: 'meals',
            builder: (context, state) => const FoundationPage(
              title: 'খাবার',
              icon: Icons.restaurant_outlined,
              description: 'Daily meal entry is planned for Phase 5.',
            ),
          ),
          GoRoute(
            path: AppRoutes.expenses,
            name: 'expenses',
            builder: (context, state) => const FoundationPage(
              title: 'বাজার / খরচ',
              icon: Icons.account_balance_wallet_outlined,
              description: 'Expense management is planned for Phase 7.',
            ),
          ),
          GoRoute(
            path: AppRoutes.members,
            name: 'members',
            builder: (context, state) => const FoundationPage(
              title: 'সদস্য',
              icon: Icons.groups_outlined,
              description: 'Member management is planned for Phase 4.',
            ),
            routes: [
              GoRoute(
                path: ':memberId',
                name: 'member-details',
                builder: (context, state) => FoundationPage(
                  title: 'সদস্যের বিবরণ',
                  icon: Icons.person_outline,
                  description: 'Member ID: ${state.pathParameters['memberId']}',
                ),
              ),
            ],
          ),
          GoRoute(
            path: AppRoutes.more,
            name: 'more',
            builder: (context, state) => const MoreFoundationPage(),
            routes: [
              GoRoute(
                path: 'settings',
                name: 'settings',
                builder: (context, state) => const SettingsFoundationPage(),
              ),
              GoRoute(
                path: 'settlement/:monthId',
                name: 'settlement',
                builder: (context, state) => FoundationPage(
                  title: 'হিসাব নিষ্পত্তি',
                  icon: Icons.calculate_outlined,
                  description:
                      'Accounting month: ${state.pathParameters['monthId']}',
                ),
              ),
              GoRoute(
                path: 'reports/:reportId',
                name: 'report-preview',
                builder: (context, state) => FoundationPage(
                  title: 'রিপোর্ট',
                  icon: Icons.bar_chart_outlined,
                  description: 'Report: ${state.pathParameters['reportId']}',
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
});
