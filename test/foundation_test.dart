import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mess_manager_bd/app/app.dart';
import 'package:mess_manager_bd/app/providers/app_providers.dart';
import 'package:mess_manager_bd/app/router/app_router.dart';
import 'package:mess_manager_bd/core/theme/app_theme.dart';
import 'package:mess_manager_bd/core/widgets/app_buttons.dart';
import 'package:mess_manager_bd/core/widgets/app_confirmation_sheet.dart';
import 'package:mess_manager_bd/core/widgets/app_content.dart';
import 'package:mess_manager_bd/core/widgets/app_fields.dart';
import 'package:mess_manager_bd/core/widgets/app_states.dart';
import 'package:mess_manager_bd/features/foundation/presentation/foundation_page.dart';
import 'package:mess_manager_bd/features/onboarding/presentation/onboarding_state.dart';

void main() {
  testWidgets('app launches inside Riverpod and renders the shell', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          startupDestinationProvider.overrideWith(
            (ref) async => StartupDestination.home,
          ),
        ],
        child: const MessManagerApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Mess Manager BD'), findsOneWidget);
    expect(find.text('হোম'), findsOneWidget);
    expect(find.text('বর্তমান মিল রেট'), findsOneWidget);
  });

  testWidgets('route redirect sends setup-required apps to setup', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appAccessStateProvider.overrideWithValue(
            const AppAccessState(needsSetup: true),
          ),
        ],
        child: const MessManagerApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('ভাষা নির্বাচন করুন'), findsOneWidget);
  });

  testWidgets('deep member route accepts an ID parameter', (tester) async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final router = container.read(appRouterProvider);
    router.go('/members/member-42');

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MessManagerApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Member ID: member-42'), findsOneWidget);
  });

  testWidgets('settings changes the active theme mode', (tester) async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          home: const SettingsFoundationPage(),
        ),
      ),
    );

    await tester.tap(find.text('অন্ধকার'));
    await tester.pump();

    expect(container.read(themeModeProvider), ThemeMode.dark);
  });

  testWidgets('shared foundation widgets expose their primary content', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: Scaffold(
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              AppPrimaryButton(label: 'সংরক্ষণ করুন', onPressed: () {}),
              AppSecondaryButton(label: 'বাতিল', onPressed: () {}),
              AppDestructiveButton(label: 'মুছে ফেলুন', onPressed: () {}),
              const AppAmountInput(label: 'পরিমাণ'),
              AppSearchField(onChanged: (_) {}),
              const AppSummaryCard(
                label: 'মোট জমা',
                value: '৳0',
                icon: Icons.savings_outlined,
              ),
              const AppStatusBadge(label: 'সফল', status: AppStatus.success),
              const AppMemberAvatar(name: 'Rahim'),
              const AppEmptyState(
                title: 'কোনো রেকর্ড নেই',
                message: 'প্রথম রেকর্ড যোগ করুন।',
              ),
              const AppErrorState(
                title: 'সংরক্ষণ করা যায়নি',
                message: 'আবার চেষ্টা করুন।',
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.text('সংরক্ষণ করুন'), findsOneWidget);
    expect(find.text('বাতিল'), findsOneWidget);
    expect(find.text('মুছে ফেলুন'), findsOneWidget);
    expect(find.text('৳ '), findsOneWidget);
    expect(find.text('সফল'), findsOneWidget);
    expect(find.text('R'), findsOneWidget);
    expect(find.text('কোনো রেকর্ড নেই'), findsOneWidget);
    await tester.drag(find.byType(ListView), const Offset(0, -800));
    await tester.pumpAndSettle();
    expect(find.text('সংরক্ষণ করা যায়নি'), findsOneWidget);
  });

  testWidgets('loading state and confirmation sheet are usable', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              const SizedBox(height: 80, child: AppLoadingState()),
              Builder(
                builder: (context) => AppPrimaryButton(
                  label: 'নিশ্চিত করুন',
                  onPressed: () => showAppConfirmationSheet(
                    context,
                    title: 'নিশ্চিত করুন',
                    message: 'এই পরিবর্তনটি সংরক্ষণ করা হবে।',
                    confirmLabel: 'হ্যাঁ, সংরক্ষণ করুন',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.tap(find.text('নিশ্চিত করুন'));
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('হ্যাঁ, সংরক্ষণ করুন'), findsOneWidget);
    expect(find.text('বাতিল'), findsOneWidget);
  });
}
