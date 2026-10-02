import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/widgets/app_scaffold.dart';
import '../../core/widgets/app_states.dart';
import '../../features/accounting/presentation/accounting_month_pages.dart';
import '../../features/expenses/presentation/expense_pages.dart';
import '../../features/foundation/presentation/foundation_page.dart';
import '../../features/guest_special/presentation/guest_special_pages.dart';
import '../../features/meals/presentation/meal_pages.dart';
import '../../features/members/presentation/member_pages.dart';
import '../../features/onboarding/presentation/onboarding_pages.dart';
import '../providers/app_providers.dart';

abstract final class AppRoutes {
  static const root = '/';
  static const splash = '/splash';
  static const setup = '/setup/language';
  static const language = '/setup/language';
  static const welcome = '/setup/welcome';
  static const createMess = '/setup/mess';
  static const manager = '/setup/manager';
  static const monthSetup = '/setup/month';
  static const setupComplete = '/setup/complete';
  static const createPin = '/setup/create-pin';
  static const confirmPin = '/setup/confirm-pin';
  static const biometrics = '/setup/biometrics';
  static const lock = '/lock';
  static const recovery = '/lock/recovery';
  static const home = '/home';
  static const meals = '/meals';
  static const mealEntry = '/meals/entry';
  static const mealCalendar = '/meals/calendar';
  static const mealDayDetails = '/meals/day';
  static const memberMealDetails = '/meals/member';
  static const guestMeals = '/meals/guests';
  static const addGuestMeal = '/meals/guests/add';
  static const specialMeals = '/meals/special';
  static const addSpecialMeal = '/meals/special/add';
  static const expenses = '/expenses';
  static const expenseList = '/expenses/list';
  static const addExpense = '/expenses/add';
  static const expenseCategories = '/expenses/categories';
  static const members = '/members';
  static const addMember = '/members/add';
  static const months = '/months';
  static const startMonth = '/months/start';
  static const more = '/more';
  static const settings = '/more/settings';
  static const settlement = '/more/settlement';
  static const reports = '/more/reports';
}

final appRouterProvider = Provider<GoRouter>((ref) {
  final accessState = ref.watch(appAccessStateProvider);

  final router = GoRouter(
    initialLocation: AppRoutes.splash,
    redirect: (context, state) {
      final path = state.uri.path;
      final onSetupRoute = path.startsWith('/setup');
      final onLockRoute = path.startsWith('/lock');

      if (accessState.needsSetup) {
        return onSetupRoute ? null : AppRoutes.setup;
      }
      if (accessState.isLocked) {
        return onLockRoute ? null : AppRoutes.lock;
      }
      if (path == AppRoutes.root) {
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
        path: AppRoutes.splash,
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.language,
        name: 'setup-language',
        builder: (context, state) => const LanguageSelectionPage(),
      ),
      GoRoute(
        path: AppRoutes.welcome,
        name: 'setup-welcome',
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        path: AppRoutes.createMess,
        name: 'setup-mess',
        builder: (context, state) => const CreateMessPage(),
      ),
      GoRoute(
        path: AppRoutes.manager,
        name: 'setup-manager',
        builder: (context, state) => const ManagerSetupPage(),
      ),
      GoRoute(
        path: AppRoutes.monthSetup,
        name: 'setup-month',
        builder: (context, state) => const AccountingMonthSetupPage(),
      ),
      GoRoute(
        path: AppRoutes.setupComplete,
        name: 'setup-complete',
        builder: (context, state) => const SetupCompletePage(),
      ),
      GoRoute(
        path: AppRoutes.createPin,
        name: 'create-pin',
        builder: (context, state) => const CreatePinPage(),
      ),
      GoRoute(
        path: AppRoutes.confirmPin,
        name: 'confirm-pin',
        builder: (context, state) => const ConfirmPinPage(),
      ),
      GoRoute(
        path: AppRoutes.biometrics,
        name: 'biometrics',
        builder: (context, state) => const BiometricSetupPage(),
      ),
      GoRoute(
        path: AppRoutes.lock,
        name: 'app-lock',
        builder: (context, state) => const AppLockPage(),
      ),
      GoRoute(
        path: AppRoutes.recovery,
        name: 'recovery-guidance',
        builder: (context, state) => const RecoveryGuidancePage(),
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
            builder: (context, state) => const MealsHomePage(),
            routes: [
              GoRoute(
                path: 'entry',
                name: 'meal-entry',
                builder: (context, state) => DailyMealEntryPage(
                  date: _routeDate(state.uri.queryParameters['date']),
                ),
              ),
              GoRoute(
                path: 'calendar',
                name: 'meal-calendar',
                builder: (context, state) => const MealCalendarPage(),
              ),
              GoRoute(
                path: 'day/:date',
                name: 'meal-day-details',
                builder: (context, state) => MealDayDetailsPage(
                  date: _routeDate(state.pathParameters['date']),
                ),
              ),
              GoRoute(
                path: 'member/:memberId',
                name: 'member-meal-details',
                builder: (context, state) => MemberMealDetailsPage(
                  memberId: state.pathParameters['memberId']!,
                ),
              ),
              GoRoute(
                path: 'guests',
                name: 'guest-meals',
                builder: (context, state) => const GuestMealsPage(),
                routes: [
                  GoRoute(
                    path: 'add',
                    name: 'guest-meal-add',
                    builder: (context, state) => const GuestMealFormPage(),
                  ),
                  GoRoute(
                    path: ':id',
                    name: 'guest-meal-details',
                    builder: (context, state) =>
                        GuestMealDetailsPage(id: state.pathParameters['id']!),
                    routes: [
                      GoRoute(
                        path: 'edit',
                        name: 'guest-meal-edit',
                        builder: (context, state) =>
                            GuestMealFormPage(id: state.pathParameters['id']!),
                      ),
                    ],
                  ),
                ],
              ),
              GoRoute(
                path: 'special',
                name: 'special-meals',
                builder: (context, state) => const SpecialMealsPage(),
                routes: [
                  GoRoute(
                    path: 'add',
                    name: 'special-meal-add',
                    builder: (context, state) => const SpecialMealFormPage(),
                  ),
                  GoRoute(
                    path: ':id',
                    name: 'special-meal-details',
                    builder: (context, state) =>
                        SpecialMealDetailsPage(id: state.pathParameters['id']!),
                    routes: [
                      GoRoute(
                        path: 'edit',
                        name: 'special-meal-edit',
                        builder: (context, state) => SpecialMealFormPage(
                          id: state.pathParameters['id']!,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: AppRoutes.expenses,
            name: 'expenses',
            builder: (context, state) => const ExpenseHomePage(),
            routes: [
              GoRoute(
                path: 'list',
                name: 'expense-list',
                builder: (context, state) => const ExpenseListPage(),
                routes: [
                  GoRoute(
                    path: ':id',
                    name: 'expense-details',
                    builder: (context, state) =>
                        ExpenseDetailsPage(id: state.pathParameters['id']!),
                    routes: [
                      GoRoute(
                        path: 'edit',
                        name: 'expense-edit',
                        builder: (context, state) =>
                            ExpenseFormPage(id: state.pathParameters['id']!),
                      ),
                    ],
                  ),
                ],
              ),
              GoRoute(
                path: 'add',
                name: 'expense-add',
                builder: (context, state) => ExpenseFormPage(
                  initialType: state.uri.queryParameters['type'],
                  memberPaid: state.uri.queryParameters['payer'] == 'member',
                ),
              ),
              GoRoute(
                path: 'categories',
                name: 'expense-categories',
                builder: (context, state) => const ExpenseCategoriesPage(),
              ),
            ],
          ),
          GoRoute(
            path: AppRoutes.members,
            name: 'members',
            builder: (context, state) => const MemberListPage(),
            routes: [
              GoRoute(
                path: 'add',
                name: 'member-add',
                builder: (context, state) => const MemberFormPage(),
              ),
              GoRoute(
                path: ':memberId',
                name: 'member-details',
                builder: (context, state) => MemberDetailsPage(
                  memberId: state.pathParameters['memberId']!,
                ),
                routes: [
                  GoRoute(
                    path: 'edit',
                    name: 'member-edit',
                    builder: (context, state) => MemberFormPage(
                      memberId: state.pathParameters['memberId']!,
                    ),
                  ),
                  GoRoute(
                    path: 'status',
                    name: 'member-status',
                    builder: (context, state) => MemberStatusPage(
                      memberId: state.pathParameters['memberId']!,
                    ),
                  ),
                  GoRoute(
                    path: 'financial',
                    name: 'member-financial',
                    builder: (context, state) => MemberRecordsPage(
                      memberId: state.pathParameters['memberId']!,
                      kind: MemberRecordKind.financial,
                    ),
                  ),
                  GoRoute(
                    path: 'meals',
                    name: 'member-meals',
                    builder: (context, state) => MemberRecordsPage(
                      memberId: state.pathParameters['memberId']!,
                      kind: MemberRecordKind.meals,
                    ),
                  ),
                  GoRoute(
                    path: 'deposits',
                    name: 'member-deposits',
                    builder: (context, state) => MemberRecordsPage(
                      memberId: state.pathParameters['memberId']!,
                      kind: MemberRecordKind.deposits,
                    ),
                  ),
                  GoRoute(
                    path: 'expenses',
                    name: 'member-expenses',
                    builder: (context, state) => MemberRecordsPage(
                      memberId: state.pathParameters['memberId']!,
                      kind: MemberRecordKind.expenses,
                    ),
                  ),
                  GoRoute(
                    path: 'adjustments',
                    name: 'member-adjustments',
                    builder: (context, state) => MemberRecordsPage(
                      memberId: state.pathParameters['memberId']!,
                      kind: MemberRecordKind.adjustments,
                    ),
                  ),
                  GoRoute(
                    path: 'history',
                    name: 'member-history',
                    builder: (context, state) => MemberRecordsPage(
                      memberId: state.pathParameters['memberId']!,
                      kind: MemberRecordKind.history,
                    ),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: AppRoutes.months,
            name: 'accounting-months',
            builder: (context, state) => const AccountingMonthSelectorPage(),
            routes: [
              GoRoute(
                path: 'start',
                name: 'accounting-month-start',
                builder: (context, state) => const StartAccountingMonthPage(),
              ),
              GoRoute(
                path: ':monthId',
                name: 'accounting-month-details',
                builder: (context, state) => AccountingMonthDetailsPage(
                  monthId: state.pathParameters['monthId']!,
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

DateTime _routeDate(String? value) =>
    DateTime.tryParse(value ?? '') ?? DateTime.now();
