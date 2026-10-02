import 'package:flutter/material.dart';

import '../theme/app_tokens.dart';

class AppSectionHeader extends StatelessWidget {
  const AppSectionHeader({
    required this.title,
    this.actionLabel,
    this.onAction,
    super.key,
  });

  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(title, style: Theme.of(context).textTheme.titleMedium),
        ),
        if (actionLabel != null)
          TextButton(onPressed: onAction, child: Text(actionLabel!)),
      ],
    );
  }
}

class AppSummaryCard extends StatelessWidget {
  const AppSummaryCard({
    required this.label,
    required this.value,
    required this.icon,
    this.color = AppColors.primary,
    this.semanticLabel,
    super.key,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color color;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel ?? '$label: $value',
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(AppRadius.field),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  child: Icon(icon, color: color),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label, style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: AppSpacing.xs),
                    Text(value, style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum AppStatus { success, warning, error, info, neutral }

class AppStatusBadge extends StatelessWidget {
  const AppStatusBadge({required this.label, required this.status, super.key});

  final String label;
  final AppStatus status;

  @override
  Widget build(BuildContext context) {
    final color = switch (status) {
      AppStatus.success => AppColors.success,
      AppStatus.warning => AppColors.warning,
      AppStatus.error => AppColors.error,
      AppStatus.info => AppColors.info,
      AppStatus.neutral => AppColors.balanceSettled,
    };

    return Semantics(
      label: label,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(color: color),
        ),
      ),
    );
  }
}

class AppMemberAvatar extends StatelessWidget {
  const AppMemberAvatar({
    required this.name,
    this.imageProvider,
    this.radius = 22,
    super.key,
  });

  final String name;
  final ImageProvider<Object>? imageProvider;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final initial = name.trim().isEmpty ? '?' : name.trim().characters.first;
    return Semantics(
      label: '$name avatar',
      image: true,
      child: CircleAvatar(
        radius: radius,
        foregroundImage: imageProvider,
        child: Text(initial.toUpperCase()),
      ),
    );
  }
}
