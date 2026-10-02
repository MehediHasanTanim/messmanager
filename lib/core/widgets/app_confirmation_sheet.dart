import 'package:flutter/material.dart';

import '../theme/app_tokens.dart';
import 'app_buttons.dart';

Future<bool?> showAppConfirmationSheet(
  BuildContext context, {
  required String title,
  required String message,
  required String confirmLabel,
  bool destructive = false,
}) {
  return showModalBottomSheet<bool>(
    context: context,
    showDragHandle: true,
    builder: (sheetContext) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg,
          AppSpacing.sm,
          AppSpacing.lg,
          AppSpacing.lg,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title, style: Theme.of(sheetContext).textTheme.titleLarge),
            const SizedBox(height: AppSpacing.sm),
            Text(message),
            const SizedBox(height: AppSpacing.lg),
            if (destructive)
              AppDestructiveButton(
                label: confirmLabel,
                onPressed: () => Navigator.pop(sheetContext, true),
              )
            else
              AppPrimaryButton(
                label: confirmLabel,
                onPressed: () => Navigator.pop(sheetContext, true),
              ),
            const SizedBox(height: AppSpacing.sm),
            AppSecondaryButton(
              label: 'বাতিল',
              onPressed: () => Navigator.pop(sheetContext, false),
            ),
          ],
        ),
      ),
    ),
  );
}
