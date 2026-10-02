import 'package:flutter/material.dart';

import '../theme/app_tokens.dart';
import 'app_buttons.dart';

class AppLoadingState extends StatelessWidget {
  const AppLoadingState({this.label = 'লোড হচ্ছে…', super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Semantics(
        label: label,
        liveRegion: true,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}

class AppEmptyState extends StatelessWidget {
  const AppEmptyState({
    required this.title,
    required this.message,
    this.actionLabel,
    this.onAction,
    this.icon = Icons.inbox_outlined,
    super.key,
  });

  final String title;
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return _StateLayout(
      icon: icon,
      color: AppColors.info,
      title: title,
      message: message,
      action: actionLabel == null
          ? null
          : AppPrimaryButton(label: actionLabel!, onPressed: onAction),
    );
  }
}

class AppErrorState extends StatelessWidget {
  const AppErrorState({
    required this.title,
    required this.message,
    this.actionLabel,
    this.onAction,
    super.key,
  });

  final String title;
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return _StateLayout(
      icon: Icons.error_outline,
      color: AppColors.error,
      title: title,
      message: message,
      action: actionLabel == null
          ? null
          : AppSecondaryButton(label: actionLabel!, onPressed: onAction),
    );
  }
}

class AppSkeletonLoading extends StatelessWidget {
  const AppSkeletonLoading({this.lines = 4, super.key});
  final int lines;
  @override
  Widget build(BuildContext context) => Semantics(
    label: 'লোড হচ্ছে',
    child: ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        for (var i = 0; i < lines; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(AppRadius.field),
              ),
            ),
          ),
      ],
    ),
  );
}

class AppNoSearchResults extends AppEmptyState {
  const AppNoSearchResults({super.key})
    : super(
        title: 'কোনো ফল পাওয়া যায়নি',
        message: 'খোঁজার শব্দ বা ফিল্টার পরিবর্তন করুন।',
        icon: Icons.search_off_outlined,
      );
}

class AppClosedMonthRestriction extends AppErrorState {
  const AppClosedMonthRestriction({super.key})
    : super(
        title: 'মাসটি বন্ধ',
        message: 'বন্ধ মাসের তথ্য পরিবর্তন করা যাবে না।',
        actionLabel: 'রিপোর্ট দেখুন',
      );
}

class AppValidationSummary extends StatelessWidget {
  const AppValidationSummary({required this.errors, super.key});
  final List<String> errors;
  @override
  Widget build(BuildContext context) => Semantics(
    liveRegion: true,
    label: 'Validation errors',
    child: Card(
      color: AppColors.error.withValues(alpha: .08),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('তথ্যগুলো ঠিক করুন'),
            for (final error in errors) Text('• $error'),
          ],
        ),
      ),
    ),
  );
}

void showAppSuccess(BuildContext context, String message) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );

class _StateLayout extends StatelessWidget {
  const _StateLayout({
    required this.icon,
    required this.color,
    required this.title,
    required this.message,
    this.action,
  });

  final IconData icon;
  final Color color;
  final String title;
  final String message;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 48),
            const SizedBox(height: AppSpacing.md),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.sm),
            Text(message, textAlign: TextAlign.center),
            if (action case final action?) ...[
              const SizedBox(height: AppSpacing.lg),
              SizedBox(width: double.infinity, child: action),
            ],
          ],
        ),
      ),
    );
  }
}
