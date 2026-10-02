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
import '../../../core/widgets/app_fields.dart';
import '../../accounting/presentation/accounting_providers.dart';
import '../domain/guest_special_models.dart';
import '../domain/guest_special_use_cases.dart';

class GuestMealsPage extends ConsumerWidget {
  const GuestMealsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final month = ref.watch(currentAccountingMonthProvider);
    return month.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('$error')),
      data: (value) {
        if (value == null)
          return const Center(child: Text('চলমান হিসাবের মাস নেই।'));
        return FutureBuilder<List<GuestMeal>>(
          future: ref
              .watch(appDatabaseProvider)
              .mealDao
              .guestMealsForMonth(value.id),
          builder: (context, snapshot) => ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              AppSectionHeader(
                title: 'অতিথি খাবার',
                actionLabel: '+ যোগ করুন',
                onAction: () => context.push(AppRoutes.addGuestMeal),
              ),
              const SizedBox(height: AppSpacing.sm),
              if (!snapshot.hasData)
                const Center(child: CircularProgressIndicator())
              else if (snapshot.data!.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(AppSpacing.xl),
                  child: Center(child: Text('এই মাসে কোনো অতিথি খাবার নেই।')),
                )
              else
                for (final meal in snapshot.data!)
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.person_add_alt_1_outlined),
                      title: Text(
                        '${DateFormat.MMMEd().format(meal.mealDate)} • ${meal.guestCount} অতিথি',
                      ),
                      subtitle: Text(_guestModeLabel(meal.chargeMethod)),
                      trailing: Text(
                        '${MealUnits(meal.mealUnits).display} মিল',
                      ),
                      onTap: () =>
                          context.push('${AppRoutes.guestMeals}/${meal.id}'),
                    ),
                  ),
            ],
          ),
        );
      },
    );
  }
}

class GuestMealDetailsPage extends ConsumerWidget {
  const GuestMealDetailsPage({required this.id, super.key});
  final String id;
  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      FutureBuilder<GuestMeal?>(
        future: ref.watch(appDatabaseProvider).mealDao.guestMealById(id),
        builder: (context, snapshot) {
          final meal = snapshot.data;
          if (!snapshot.hasData)
            return const Center(child: CircularProgressIndicator());
          if (meal == null)
            return const Center(child: Text('অতিথি খাবারটি পাওয়া যায়নি।'));
          return ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              const AppSectionHeader(title: 'অতিথি খাবারের বিবরণ'),
              AppSummaryCard(
                label: 'অতিথি',
                value: '${meal.guestCount} জন',
                icon: Icons.group_add_outlined,
              ),
              AppSummaryCard(
                label: 'খাবার',
                value: MealUnits(meal.mealUnits).display,
                icon: Icons.restaurant_outlined,
              ),
              if (meal.directChargeMinor > 0)
                AppSummaryCard(
                  label: 'সরাসরি চার্জ',
                  value: _money(meal.directChargeMinor),
                  icon: Icons.payments_outlined,
                ),
              OutlinedButton.icon(
                onPressed: () =>
                    context.push('${AppRoutes.guestMeals}/${meal.id}/edit'),
                icon: const Icon(Icons.edit_outlined),
                label: const Text('সম্পাদনা'),
              ),
            ],
          );
        },
      );
}

class GuestMealFormPage extends ConsumerStatefulWidget {
  const GuestMealFormPage({this.id, super.key});
  final String? id;
  @override
  ConsumerState<GuestMealFormPage> createState() => _GuestMealFormPageState();
}

class _GuestMealFormPageState extends ConsumerState<GuestMealFormPage> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _count = TextEditingController(text: '1');
  final _units = TextEditingController(text: '1');
  final _charge = TextEditingController();
  DateTime _date = DateTime.now();
  GuestChargeMode _mode = GuestChargeMode.addToHostMeal;
  String? _hostId;
  bool _saving = false;
  @override
  void dispose() {
    _name.dispose();
    _count.dispose();
    _units.dispose();
    _charge.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mess = ref.watch(currentMessProvider);
    final month = ref.watch(currentAccountingMonthProvider);
    if (!mess.hasValue || !month.hasValue)
      return const Center(child: CircularProgressIndicator());
    if (mess.value == null || month.value == null)
      return const Center(child: Text('চলমান হিসাবের মাস নেই।'));
    return FutureBuilder<List<Member>>(
      future: ref
          .watch(appDatabaseProvider)
          .mealDao
          .eligibleMembersForDate(mess.value!.id, _date),
      builder: (context, snapshot) {
        final members = snapshot.data ?? const <Member>[];
        _hostId ??= members.isEmpty ? null : members.first.id;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              widget.id == null
                  ? 'অতিথি খাবার যোগ করুন'
                  : 'অতিথি খাবার সম্পাদনা',
            ),
          ),
          body: Form(
            key: _form,
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.md),
              children: [
                DropdownButtonFormField<String>(
                  initialValue: _hostId,
                  decoration: const InputDecoration(labelText: 'হোস্ট সদস্য'),
                  items: [
                    for (final member in members)
                      DropdownMenuItem(
                        value: member.id,
                        child: Text(member.name),
                      ),
                  ],
                  onChanged: (value) => setState(() => _hostId = value),
                  validator: (value) => value == null ? 'হোস্ট বাছুন' : null,
                ),
                AppTextField(label: 'অতিথির নাম', controller: _name),
                AppTextField(
                  label: 'অতিথির সংখ্যা',
                  controller: _count,
                  validator: (value) => (int.tryParse(value ?? '') ?? 0) < 1
                      ? 'কমপক্ষে ১ জন দিন'
                      : null,
                ),
                AppTextField(
                  label: 'খাবারের পরিমাণ',
                  controller: _units,
                  validator: (value) => num.tryParse(value ?? '') == null
                      ? 'সঠিক খাবারের পরিমাণ দিন'
                      : null,
                ),
                ListTile(
                  title: const Text('তারিখ'),
                  subtitle: Text(DateFormat.yMMMd().format(_date)),
                  trailing: const Icon(Icons.calendar_today_outlined),
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: _date,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) setState(() => _date = picked);
                  },
                ),
                SegmentedButton<GuestChargeMode>(
                  segments: const [
                    ButtonSegment(
                      value: GuestChargeMode.addToHostMeal,
                      label: Text('হোস্টে যোগ'),
                    ),
                    ButtonSegment(
                      value: GuestChargeMode.directCharge,
                      label: Text('সরাসরি চার্জ'),
                    ),
                    ButtonSegment(
                      value: GuestChargeMode.generalMess,
                      label: Text('সাধারণ মেস'),
                    ),
                  ],
                  selected: {_mode},
                  onSelectionChanged: (value) =>
                      setState(() => _mode = value.first),
                ),
                if (_mode == GuestChargeMode.directCharge)
                  AppAmountInput(
                    label: 'চার্জ',
                    controller: _charge,
                    validator: (value) => (num.tryParse(value ?? '') ?? 0) <= 0
                        ? 'চার্জ দিন'
                        : null,
                  ),
                const SizedBox(height: AppSpacing.lg),
                FilledButton(
                  onPressed: _saving
                      ? null
                      : () => _save(mess.value!.id, month.value!.id),
                  child: Text(_saving ? 'সংরক্ষণ হচ্ছে…' : 'সংরক্ষণ করুন'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _save(String messId, String monthId) async {
    if (!_form.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      final draft = GuestMealDraft(
        messId: messId,
        accountingMonthId: monthId,
        hostMemberId: _hostId!,
        date: _date,
        guestName: _name.text,
        guestCount: int.parse(_count.text),
        mealUnits: (num.parse(_units.text) * MealUnits.scale).round(),
        chargeMode: _mode,
        directChargeMinor: _mode == GuestChargeMode.directCharge
            ? (num.parse(_charge.text) * 100).round()
            : 0,
      );
      await AddGuestMeal(ref.read(appDatabaseProvider))(
        id: widget.id ?? 'guest-${DateTime.now().microsecondsSinceEpoch}',
        draft: draft,
      );
      if (mounted) context.pop();
    } catch (error) {
      if (mounted)
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('$error')));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }
}

class SpecialMealsPage extends ConsumerWidget {
  const SpecialMealsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final month = ref.watch(currentAccountingMonthProvider);
    return month.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('$error')),
      data: (value) {
        if (value == null)
          return const Center(child: Text('চলমান হিসাবের মাস নেই।'));
        return FutureBuilder<List<SpecialMeal>>(
          future: ref
              .watch(appDatabaseProvider)
              .mealDao
              .specialMealsForMonth(value.id),
          builder: (context, snapshot) => ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              AppSectionHeader(
                title: 'বিশেষ খাবার',
                actionLabel: '+ যোগ করুন',
                onAction: () => context.push(AppRoutes.addSpecialMeal),
              ),
              if (!snapshot.hasData)
                const Center(child: CircularProgressIndicator())
              else if (snapshot.data!.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(AppSpacing.xl),
                  child: Center(child: Text('এই মাসে কোনো বিশেষ খাবার নেই।')),
                )
              else
                for (final meal in snapshot.data!)
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.celebration_outlined),
                      title: Text(meal.title),
                      subtitle: Text(DateFormat.yMMMd().format(meal.date)),
                      trailing: Text(_money(meal.totalCostMinor)),
                      onTap: () =>
                          context.push('${AppRoutes.specialMeals}/${meal.id}'),
                    ),
                  ),
            ],
          ),
        );
      },
    );
  }
}

class SpecialMealFormPage extends ConsumerStatefulWidget {
  const SpecialMealFormPage({this.id, super.key});
  final String? id;
  @override
  ConsumerState<SpecialMealFormPage> createState() =>
      _SpecialMealFormPageState();
}

class _SpecialMealFormPageState extends ConsumerState<SpecialMealFormPage> {
  final _form = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _cost = TextEditingController();
  final _custom = <String, TextEditingController>{};
  DateTime _date = DateTime.now();
  SpecialMealDistribution _distribution = SpecialMealDistribution.equal;
  final _selected = <String>{};
  bool _saving = false;
  @override
  void dispose() {
    _title.dispose();
    _cost.dispose();
    for (final controller in _custom.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mess = ref.watch(currentMessProvider);
    final month = ref.watch(currentAccountingMonthProvider);
    if (!mess.hasValue || !month.hasValue)
      return const Center(child: CircularProgressIndicator());
    if (mess.value == null || month.value == null)
      return const Center(child: Text('চলমান হিসাবের মাস নেই।'));
    return FutureBuilder<List<Member>>(
      future: ref
          .watch(appDatabaseProvider)
          .mealDao
          .eligibleMembersForDate(mess.value!.id, _date),
      builder: (context, snapshot) {
        final members = snapshot.data ?? const <Member>[];
        return Scaffold(
          appBar: AppBar(
            title: Text(
              widget.id == null
                  ? 'বিশেষ খাবার যোগ করুন'
                  : 'বিশেষ খাবার সম্পাদনা',
            ),
          ),
          body: Form(
            key: _form,
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.md),
              children: [
                AppTextField(
                  label: 'শিরোনাম *',
                  controller: _title,
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'শিরোনাম দিন'
                      : null,
                ),
                AppAmountInput(
                  label: 'মোট খরচ *',
                  controller: _cost,
                  validator: (value) =>
                      (num.tryParse(value ?? '') ?? 0) <= 0 ? 'খরচ দিন' : null,
                ),
                ListTile(
                  title: const Text('তারিখ'),
                  subtitle: Text(DateFormat.yMMMd().format(_date)),
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: _date,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) setState(() => _date = picked);
                  },
                ),
                SegmentedButton<SpecialMealDistribution>(
                  segments: const [
                    ButtonSegment(
                      value: SpecialMealDistribution.equal,
                      label: Text('সমান'),
                    ),
                    ButtonSegment(
                      value: SpecialMealDistribution.custom,
                      label: Text('কাস্টম'),
                    ),
                    ButtonSegment(
                      value: SpecialMealDistribution.singleMember,
                      label: Text('একজন'),
                    ),
                  ],
                  selected: {_distribution},
                  onSelectionChanged: (value) =>
                      setState(() => _distribution = value.first),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'অংশগ্রহণকারী',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                for (final member in members)
                  CheckboxListTile(
                    value: _selected.contains(member.id),
                    title: Text(member.name),
                    onChanged: (value) => setState(() {
                      if (value ?? false)
                        _selected.add(member.id);
                      else {
                        _selected.remove(member.id);
                        _custom.remove(member.id)?.dispose();
                      }
                    }),
                  ),
                if (_distribution == SpecialMealDistribution.custom)
                  for (final member in members.where(
                    (member) => _selected.contains(member.id),
                  ))
                    AppAmountInput(
                      label: '${member.name} এর অংশ',
                      controller: _custom.putIfAbsent(
                        member.id,
                        TextEditingController.new,
                      ),
                      onChanged: (_) => setState(() {}),
                    ),
                const SizedBox(height: AppSpacing.sm),
                _AllocationPreview(
                  costText: _cost.text,
                  distribution: _distribution,
                  selected: _selected.toList(),
                  custom: {
                    for (final item in _custom.entries)
                      item.key: ((num.tryParse(item.value.text) ?? 0) * 100)
                          .round(),
                  },
                ),
                FilledButton(
                  onPressed: _saving
                      ? null
                      : () => _save(mess.value!.id, month.value!.id),
                  child: Text(_saving ? 'সংরক্ষণ হচ্ছে…' : 'সংরক্ষণ করুন'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _save(String messId, String monthId) async {
    if (!_form.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      final cost = (num.parse(_cost.text) * 100).round();
      final draft = SpecialMealDraft(
        messId: messId,
        accountingMonthId: monthId,
        date: _date,
        title: _title.text,
        totalCostMinor: cost,
        distribution: _distribution,
        participantIds: _selected.toList(),
        customAllocations: {
          for (final item in _custom.entries)
            item.key: ((num.tryParse(item.value.text) ?? 0) * 100).round(),
        },
      );
      await CreateSpecialMeal(ref.read(appDatabaseProvider))(
        id: widget.id ?? 'special-${DateTime.now().microsecondsSinceEpoch}',
        draft: draft,
      );
      if (mounted) context.pop();
    } catch (error) {
      if (mounted)
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('$error')));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }
}

class _AllocationPreview extends StatelessWidget {
  const _AllocationPreview({
    required this.costText,
    required this.distribution,
    required this.selected,
    required this.custom,
  });
  final String costText;
  final SpecialMealDistribution distribution;
  final List<String> selected;
  final Map<String, int> custom;
  @override
  Widget build(BuildContext context) {
    final cost = (num.tryParse(costText) ?? 0) * 100;
    if (selected.isEmpty) return const Text('অংশগ্রহণকারী বাছুন।');
    try {
      final allocations = AllocateSpecialMealCost()(
        SpecialMealDraft(
          messId: '',
          accountingMonthId: '',
          date: DateTime.now(),
          title: 'Preview',
          totalCostMinor: cost.round(),
          distribution: distribution,
          participantIds: selected,
          customAllocations: custom,
        ),
      );
      return Text(
        'বণ্টন প্রিভিউ: ${allocations.values.map(_money).join(' • ')}',
      );
    } catch (_) {
      return const Text('সঠিক বণ্টন বাছুন।');
    }
  }
}

class SpecialMealDetailsPage extends ConsumerWidget {
  const SpecialMealDetailsPage({required this.id, super.key});
  final String id;
  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      FutureBuilder<List<SpecialMealMember>>(
        future: ref
            .watch(appDatabaseProvider)
            .mealDao
            .specialMealParticipants(id),
        builder: (context, snapshot) => ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            const AppSectionHeader(title: 'বিশেষ খাবারের বিবরণ'),
            if (!snapshot.hasData)
              const Center(child: CircularProgressIndicator())
            else
              for (final allocation in snapshot.data!)
                Card(
                  child: ListTile(
                    title: Text('সদস্য ${allocation.memberId}'),
                    trailing: Text(_money(allocation.shareAmountMinor)),
                  ),
                ),
          ],
        ),
      );
}

String _guestModeLabel(String value) => switch (value) {
  'addToHostMeal' => 'হোস্টের খাবারে যোগ',
  'directCharge' => 'সরাসরি চার্জ',
  _ => 'সাধারণ মেস খাবার',
};
String _money(int minor) => '৳${(minor / 100).toStringAsFixed(2)}';
