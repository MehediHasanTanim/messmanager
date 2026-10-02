// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../app/router/app_router.dart';
import '../../../core/database/app_database.dart';
import '../../../core/database/database_provider.dart';
import '../../../core/money/meal_units.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/widgets/app_content.dart';
import '../../accounting/presentation/accounting_providers.dart';
import '../domain/meal_models.dart';
import '../domain/meal_use_cases.dart';
import 'meal_providers.dart';

class MealsHomePage extends ConsumerStatefulWidget {
  const MealsHomePage({super.key});
  @override
  ConsumerState<MealsHomePage> createState() => _MealsHomePageState();
}

class _MealsHomePageState extends ConsumerState<MealsHomePage> {
  DateTime _date = _day(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final mess = ref.watch(currentMessProvider);
    final month = ref.watch(currentAccountingMonthProvider);
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        AppSectionHeader(
          title: 'খাবার',
          actionLabel: 'ক্যালেন্ডার',
          onAction: () => context.push(AppRoutes.mealCalendar),
        ),
        const SizedBox(height: AppSpacing.sm),
        _DateSelector(
          date: _date,
          onChanged: (date) => setState(() => _date = date),
        ),
        const SizedBox(height: AppSpacing.md),
        if (mess.hasValue &&
            month.hasValue &&
            mess.value != null &&
            month.value != null)
          _DailyHomeSummary(messId: mess.value!.id, date: _date)
        else
          const Center(child: CircularProgressIndicator()),
        const SizedBox(height: AppSpacing.md),
        FilledButton.icon(
          onPressed: () =>
              context.push('${AppRoutes.mealEntry}?date=${_wireDate(_date)}'),
          icon: const Icon(Icons.edit_outlined),
          label: const Text('খাবার লিখুন / সম্পাদনা করুন'),
        ),
        const SizedBox(height: AppSpacing.sm),
        OutlinedButton.icon(
          onPressed: () =>
              context.push('${AppRoutes.mealDayDetails}/${_wireDate(_date)}'),
          icon: const Icon(Icons.summarize_outlined),
          label: const Text('দিনের সারাংশ'),
        ),
      ],
    );
  }
}

class _DailyHomeSummary extends ConsumerWidget {
  const _DailyHomeSummary({required this.messId, required this.date});
  final String messId;
  final DateTime date;
  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) => FutureBuilder<DailyMealSheet>(
    future: GetMealsForDate(ref.watch(appDatabaseProvider))(
      messId: messId,
      date: date,
    ),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return const LinearProgressIndicator();
      final entries = snapshot.data!.entries.values;
      final total = entries.fold(0, (sum, entry) => sum + entry.totalUnits);
      return Column(
        children: [
          AppSummaryCard(
            label: 'আজকের খাবার',
            value: _displayUnits(total),
            icon: Icons.restaurant_outlined,
          ),
          AppSummaryCard(
            label: 'এন্ট্রি হয়েছে',
            value: '${entries.length} / ${snapshot.data!.members.length} সদস্য',
            icon: Icons.groups_outlined,
            color: entries.length == snapshot.data!.members.length
                ? AppColors.success
                : AppColors.warning,
          ),
        ],
      );
    },
  );
}

class DailyMealEntryPage extends ConsumerWidget {
  const DailyMealEntryPage({required this.date, super.key});
  final DateTime date;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mess = ref.watch(currentMessProvider);
    final month = ref.watch(currentAccountingMonthProvider);
    if (!mess.hasValue || !month.hasValue)
      return const Center(child: CircularProgressIndicator());
    if (mess.value == null || month.value == null)
      return const Center(child: Text('চলমান হিসাবের মাস পাওয়া যায়নি।'));
    return _DailyMealSheetEditor(
      key: ValueKey('${mess.value!.id}-${month.value!.id}-${_wireDate(date)}'),
      messId: mess.value!.id,
      month: month.value!,
      date: date,
    );
  }
}

class _DailyMealSheetEditor extends ConsumerStatefulWidget {
  const _DailyMealSheetEditor({
    required this.messId,
    required this.month,
    required this.date,
    super.key,
  });
  final String messId;
  final AccountingMonth month;
  final DateTime date;
  @override
  ConsumerState<_DailyMealSheetEditor> createState() =>
      _DailyMealSheetEditorState();
}

class _DailyMealSheetEditorState extends ConsumerState<_DailyMealSheetEditor> {
  late Future<DailyMealSheet> _sheetFuture;
  Map<String, DailyMealDraft>? _drafts;
  MealEntryMode _mode = MealEntryMode.separate;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _sheetFuture = GetMealsForDate(ref.read(appDatabaseProvider))(
      messId: widget.messId,
      date: widget.date,
    );
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<DailyMealSheet>(
    future: _sheetFuture,
    builder: (context, snapshot) {
      if (!snapshot.hasData)
        return const Center(child: CircularProgressIndicator());
      final sheet = snapshot.data!;
      _drafts ??= {
        for (final member in sheet.members)
          member.id: sheet.entries.containsKey(member.id)
              ? DailyMealDraft.fromEntry(sheet.entries[member.id]!)
              : DailyMealDraft(memberId: member.id),
      };
      final total = CalculateDailyMealTotal()(_drafts!.values, _mode);
      final closed = widget.month.status == 'closed';
      return Scaffold(
        appBar: AppBar(
          title: Text('${DateFormat.MMMEd().format(widget.date)} • খাবার'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.sm,
                AppSpacing.md,
                0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SegmentedButton<MealEntryMode>(
                      segments: const [
                        ButtonSegment(
                          value: MealEntryMode.separate,
                          label: Text('আলাদা মিল'),
                        ),
                        ButtonSegment(
                          value: MealEntryMode.total,
                          label: Text('মোট ইউনিট'),
                        ),
                      ],
                      selected: {_mode},
                      onSelectionChanged: closed
                          ? null
                          : (value) => _changeMode(value.first),
                    ),
                  ),
                  IconButton(
                    tooltip: 'আগের দিনের কপি',
                    onPressed: closed ? null : () => _copyPrevious(sheet),
                    icon: const Icon(Icons.copy_outlined),
                  ),
                ],
              ),
            ),
            if (closed)
              const Padding(
                padding: EdgeInsets.all(AppSpacing.sm),
                child: AppStatusBadge(
                  label: 'বন্ধ মাস — শুধু দেখা যাবে',
                  status: AppStatus.neutral,
                ),
              ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(AppSpacing.md),
                itemCount: sheet.members.length,
                itemBuilder: (context, index) {
                  final member = sheet.members[index];
                  return _MealMemberRow(
                    member: member,
                    draft: _drafts![member.id]!,
                    mode: _mode,
                    enabled: !closed,
                    onChanged: (value) =>
                        setState(() => _drafts![member.id] = value),
                  );
                },
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${sheet.members.length} সদস্য • ${total.display} মিল',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    FilledButton(
                      onPressed: closed || _saving ? null : _save,
                      child: Text(_saving ? 'সংরক্ষণ হচ্ছে…' : 'সংরক্ষণ করুন'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );

  Future<void> _copyPrevious(DailyMealSheet sheet) async {
    try {
      final previous =
          await CopyPreviousDayMeals(ref.read(appDatabaseProvider))(
            messId: widget.messId,
            date: widget.date,
            eligibleMembers: sheet.members,
          );
      setState(() {
        _drafts = {
          for (final item in previous)
            item.memberId: _mode == MealEntryMode.separate
                ? item.copyWith(clearTotal: true)
                : item.copyWith(
                    breakfastUnits: 0,
                    lunchUnits: 0,
                    dinnerUnits: 0,
                    extraUnits: 0,
                    totalUnits:
                        item.totalUnits ??
                        (item.breakfastUnits +
                            item.lunchUnits +
                            item.dinnerUnits +
                            item.extraUnits),
                  ),
        };
      });
    } catch (error) {
      if (mounted)
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('$error')));
    }
  }

  void _changeMode(MealEntryMode nextMode) {
    if (nextMode == _mode) return;
    setState(() {
      _drafts = {
        for (final draft in _drafts!.values)
          draft.memberId: nextMode == MealEntryMode.total
              ? draft.copyWith(
                  breakfastUnits: 0,
                  lunchUnits: 0,
                  dinnerUnits: 0,
                  extraUnits: 0,
                  totalUnits: draft.totalFor(MealEntryMode.separate),
                )
              : draft.copyWith(
                  breakfastUnits: 0,
                  lunchUnits: 0,
                  dinnerUnits: 0,
                  extraUnits: draft.totalFor(MealEntryMode.total),
                  clearTotal: true,
                ),
      };
      _mode = nextMode;
    });
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    try {
      await RecordDailyMeals(ref.read(appDatabaseProvider))(
        messId: widget.messId,
        accountingMonthId: widget.month.id,
        date: widget.date,
        mode: _mode,
        entries: _drafts!.values.toList(),
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('খাবারের এন্ট্রি সংরক্ষিত হয়েছে।')),
        );
        context.pop();
      }
    } catch (error) {
      if (mounted)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('সংরক্ষণ করা যায়নি। আবার চেষ্টা করুন। $error'),
          ),
        );
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }
}

class _MealMemberRow extends StatelessWidget {
  const _MealMemberRow({
    required this.member,
    required this.draft,
    required this.mode,
    required this.enabled,
    required this.onChanged,
  });
  final Member member;
  final DailyMealDraft draft;
  final MealEntryMode mode;
  final bool enabled;
  final ValueChanged<DailyMealDraft> onChanged;
  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(member.name, style: Theme.of(context).textTheme.titleMedium),
          if (member.roomNumber != null) Text('রুম ${member.roomNumber}'),
          const SizedBox(height: AppSpacing.xs),
          if (mode == MealEntryMode.separate)
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.xs,
              children: [
                _QuantityPicker(
                  label: 'সকাল',
                  value: draft.breakfastUnits,
                  enabled: enabled,
                  onChanged: (value) => onChanged(
                    draft.copyWith(breakfastUnits: value, clearTotal: true),
                  ),
                ),
                _QuantityPicker(
                  label: 'দুপুর',
                  value: draft.lunchUnits,
                  enabled: enabled,
                  onChanged: (value) => onChanged(
                    draft.copyWith(lunchUnits: value, clearTotal: true),
                  ),
                ),
                _QuantityPicker(
                  label: 'রাত',
                  value: draft.dinnerUnits,
                  enabled: enabled,
                  onChanged: (value) => onChanged(
                    draft.copyWith(dinnerUnits: value, clearTotal: true),
                  ),
                ),
                _QuantityPicker(
                  label: 'অতিরিক্ত',
                  value: draft.extraUnits,
                  enabled: enabled,
                  onChanged: (value) => onChanged(
                    draft.copyWith(extraUnits: value, clearTotal: true),
                  ),
                ),
              ],
            )
          else
            _QuantityPicker(
              label: 'মোট খাবার',
              value: draft.totalUnits ?? draft.totalFor(MealEntryMode.separate),
              enabled: enabled,
              onChanged: (value) => onChanged(
                draft.copyWith(
                  breakfastUnits: 0,
                  lunchUnits: 0,
                  dinnerUnits: 0,
                  extraUnits: 0,
                  totalUnits: value,
                ),
              ),
            ),
          const SizedBox(height: AppSpacing.xs),
          Text('মোট: ${_displayUnits(draft.totalFor(mode))}'),
        ],
      ),
    ),
  );
}

class _QuantityPicker extends StatelessWidget {
  const _QuantityPicker({
    required this.label,
    required this.value,
    required this.enabled,
    required this.onChanged,
  });
  final String label;
  final int value;
  final bool enabled;
  final ValueChanged<int> onChanged;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(label),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: !enabled || value == 0
                ? null
                : () => onChanged(value - MealUnits.half.scaledUnits),
          ),
          ChoiceChip(
            label: Text(_displayUnits(value)),
            selected: true,
            onSelected: enabled
                ? (_) =>
                      onChanged(value == 0 ? MealUnits.half.scaledUnits : value)
                : null,
          ),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: !enabled
                ? null
                : () => onChanged(value + MealUnits.half.scaledUnits),
          ),
        ],
      ),
    ],
  );
}

class MealCalendarPage extends ConsumerWidget {
  const MealCalendarPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final month = ref.watch(currentAccountingMonthProvider);
    return month.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('$error')),
      data: (value) {
        if (value == null)
          return const Center(child: Text('চলমান হিসাবের মাস নেই।'));
        final calendar = ref.watch(mealCalendarProvider(value.id));
        return ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            const AppSectionHeader(title: 'খাবারের ক্যালেন্ডার'),
            calendar.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Text('$error'),
              data: (days) => days.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.all(AppSpacing.xl),
                      child: Center(
                        child: Text('এই মাসে কোনো খাবার লেখা হয়নি।'),
                      ),
                    )
                  : Column(
                      children: [
                        for (final day in days)
                          Card(
                            child: ListTile(
                              leading: const Icon(
                                Icons.calendar_today_outlined,
                              ),
                              title: Text(DateFormat.MMMEd().format(day.date)),
                              subtitle: Text(
                                '${day.enteredMembers} সদস্য এন্ট্রি করেছেন',
                              ),
                              trailing: Text(
                                '${_displayUnits(day.totalUnits)} মিল',
                              ),
                              onTap: () => context.push(
                                '${AppRoutes.mealDayDetails}/${_wireDate(day.date)}',
                              ),
                            ),
                          ),
                      ],
                    ),
            ),
          ],
        );
      },
    );
  }
}

class MealDayDetailsPage extends ConsumerWidget {
  const MealDayDetailsPage({required this.date, super.key});
  final DateTime date;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mess = ref.watch(currentMessProvider);
    if (!mess.hasValue || mess.value == null)
      return const Center(child: CircularProgressIndicator());
    return FutureBuilder<DailyMealSheet>(
      future: GetMealsForDate(ref.watch(appDatabaseProvider))(
        messId: mess.value!.id,
        date: date,
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return const Center(child: CircularProgressIndicator());
        final sheet = snapshot.data!;
        return ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            AppSectionHeader(
              title: '${DateFormat.yMMMd().format(date)} — সারাংশ',
              actionLabel: 'সম্পাদনা',
              onAction: () => context.push(
                '${AppRoutes.mealEntry}?date=${_wireDate(date)}',
              ),
            ),
            AppSummaryCard(
              label: 'মোট খাবার',
              value: _displayUnits(
                sheet.entries.values.fold(
                  0,
                  (sum, entry) => sum + entry.totalUnits,
                ),
              ),
              icon: Icons.restaurant_outlined,
            ),
            for (final member in sheet.members)
              Card(
                child: ListTile(
                  title: Text(member.name),
                  trailing: Text(
                    _displayUnits(sheet.entries[member.id]?.totalUnits ?? 0),
                  ),
                  onTap: () => context.push(
                    '${AppRoutes.memberMealDetails}/${member.id}',
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class MemberMealDetailsPage extends ConsumerWidget {
  const MemberMealDetailsPage({required this.memberId, super.key});
  final String memberId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final month = ref.watch(currentAccountingMonthProvider);
    return month.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('$error')),
      data: (value) {
        if (value == null)
          return const Center(child: Text('চলমান হিসাবের মাস নেই।'));
        return StreamBuilder<List<MealEntry>>(
          stream: GetMemberMealHistory(ref.watch(appDatabaseProvider))(
            memberId,
            value.id,
          ),
          builder: (context, snapshot) => ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              const AppSectionHeader(title: 'সদস্যের খাবার'),
              if (!snapshot.hasData)
                const Center(child: CircularProgressIndicator())
              else
                for (final entry in snapshot.data!)
                  Card(
                    child: ListTile(
                      title: Text(DateFormat.yMMMd().format(entry.mealDate)),
                      trailing: Text('${_displayUnits(entry.totalUnits)} মিল'),
                    ),
                  ),
            ],
          ),
        );
      },
    );
  }
}

class _DateSelector extends StatelessWidget {
  const _DateSelector({required this.date, required this.onChanged});
  final DateTime date;
  final ValueChanged<DateTime> onChanged;
  @override
  Widget build(BuildContext context) => Card(
    child: Row(
      children: [
        IconButton(
          onPressed: () => onChanged(date.subtract(const Duration(days: 1))),
          icon: const Icon(Icons.chevron_left),
        ),
        Expanded(
          child: TextButton(
            onPressed: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: date,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (picked != null) onChanged(_day(picked));
            },
            child: Text(DateFormat.yMMMMd().format(date)),
          ),
        ),
        IconButton(
          onPressed: () => onChanged(date.add(const Duration(days: 1))),
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    ),
  );
}

DateTime _day(DateTime value) => DateTime(value.year, value.month, value.day);
String _wireDate(DateTime value) => DateFormat('yyyy-MM-dd').format(value);
String _displayUnits(int value) => MealUnits(value).display;
