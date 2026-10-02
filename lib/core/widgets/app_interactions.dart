import 'package:flutter/material.dart';

import '../theme/app_tokens.dart';

Future<DateTime?> showAppDatePicker(
  BuildContext context, {
  required DateTime initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) => showDatePicker(
  context: context,
  initialDate: initialDate,
  firstDate: firstDate ?? DateTime(2000),
  lastDate: lastDate ?? DateTime(2100),
);
Future<DateTime?> showAppMonthPicker(BuildContext context, DateTime initial) =>
    showAppDatePicker(
      context,
      initialDate: initial,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    ).then((date) => date == null ? null : DateTime(date.year, date.month));

class AppMemberSelector extends StatelessWidget {
  const AppMemberSelector({
    required this.label,
    required this.members,
    required this.value,
    required this.onChanged,
    super.key,
  });
  final String label;
  final Map<String, String> members;
  final String? value;
  final ValueChanged<String?> onChanged;
  @override
  Widget build(BuildContext context) => DropdownButtonFormField<String>(
    value: value,
    decoration: InputDecoration(labelText: label),
    items: members.entries
        .map(
          (entry) =>
              DropdownMenuItem(value: entry.key, child: Text(entry.value)),
        )
        .toList(),
    onChanged: onChanged,
  );
}

class AppMultiMemberSelector extends StatelessWidget {
  const AppMultiMemberSelector({
    required this.members,
    required this.selected,
    required this.onChanged,
    super.key,
  });
  final Map<String, String> members;
  final Set<String> selected;
  final ValueChanged<Set<String>> onChanged;
  @override
  Widget build(BuildContext context) => Column(
    children: [
      for (final entry in members.entries)
        CheckboxListTile(
          value: selected.contains(entry.key),
          title: Text(entry.value),
          onChanged: (checked) {
            final next = {...selected};
            checked == true ? next.add(entry.key) : next.remove(entry.key);
            onChanged(next);
          },
        ),
    ],
  );
}

Future<T?> showAppSortSheet<T>(
  BuildContext context, {
  required String title,
  required List<({T value, String label})> options,
}) => showModalBottomSheet<T>(
  context: context,
  showDragHandle: true,
  builder: (sheet) => SafeArea(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: Theme.of(sheet).textTheme.titleMedium),
        for (final option in options)
          ListTile(
            title: Text(option.label),
            onTap: () => Navigator.pop(sheet, option.value),
          ),
      ],
    ),
  ),
);
