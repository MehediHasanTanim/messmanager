import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../app/router/app_router.dart';
import '../../../core/database/app_database.dart';
import '../../../core/database/database_provider.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/widgets/app_content.dart';
import '../../../core/widgets/app_fields.dart';
import '../../accounting/presentation/accounting_providers.dart';
import '../domain/finance_models.dart';
import '../domain/finance_use_cases.dart';

class UtilityBillsPage extends ConsumerWidget {
  const UtilityBillsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final month = ref.watch(currentAccountingMonthProvider);
    return month.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('$e')),
      data: (value) {
        if (value == null)
          return const Center(child: Text('চলমান হিসাবের মাস নেই।'));
        return FutureBuilder<List<UtilityBill>>(
          future: ref
              .watch(appDatabaseProvider)
              .utilityDao
              .billsForMonth(value.id),
          builder: (context, snap) => ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              AppSectionHeader(
                title: 'ইউটিলিটি বিল',
                actionLabel: '+ বিল',
                onAction: () => context.push(AppRoutes.addUtilityBill),
              ),
              if (!snap.hasData)
                const Center(child: CircularProgressIndicator())
              else
                ...snap.data!.map(
                  (bill) => Card(
                    child: ListTile(
                      title: Text(bill.billType),
                      subtitle: Text(
                        '${DateFormat.yMMMd().format(bill.billingMonth)} · ${bill.status == 'paid' ? 'পরিশোধিত' : 'বকেয়া'}',
                      ),
                      trailing: Text(_money(bill.amountMinor)),
                      onTap: bill.status == 'paid' || value.status == 'closed'
                          ? null
                          : () async {
                              await MarkBillPaid(ref.read(appDatabaseProvider))(
                                bill.id,
                                value.id,
                              );
                              ref.invalidate(currentAccountingMonthProvider);
                            },
                    ),
                  ),
                ),
              if (snap.hasData && snap.data!.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(24),
                  child: Text('এখনও কোনো ইউটিলিটি বিল নেই।'),
                ),
            ],
          ),
        );
      },
    );
  }
}

class UtilityBillFormPage extends ConsumerStatefulWidget {
  const UtilityBillFormPage({super.key});
  @override
  ConsumerState<UtilityBillFormPage> createState() =>
      _UtilityBillFormPageState();
}

class _UtilityBillFormPageState extends ConsumerState<UtilityBillFormPage> {
  final _form = GlobalKey<FormState>();
  final _type = TextEditingController();
  final _amount = TextEditingController();
  bool _saving = false;
  @override
  void dispose() {
    _type.dispose();
    _amount.dispose();
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
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        const AppSectionHeader(title: 'ইউটিলিটি বিল যোগ করুন'),
        Form(
          key: _form,
          child: Column(
            children: [
              AppTextField(
                label: 'বিলের ধরন',
                controller: _type,
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'বিলের ধরন দিন' : null,
              ),
              AppAmountInput(
                label: 'পরিমাণ',
                controller: _amount,
                validator: (v) => _minor(v) <= 0 ? 'সঠিক পরিমাণ দিন' : null,
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: _saving
                    ? null
                    : () async {
                        if (!_form.currentState!.validate()) return;
                        setState(() => _saving = true);
                        try {
                          final active = await ref
                              .read(appDatabaseProvider)
                              .memberDao
                              .watchActiveMembers(mess.value!.id)
                              .first;
                          await AddUtilityBill(ref.read(appDatabaseProvider))(
                            id: 'utility-${DateTime.now().microsecondsSinceEpoch}',
                            draft: UtilityBillDraft(
                              messId: mess.value!.id,
                              accountingMonthId: month.value!.id,
                              billType: _type.text,
                              amountMinor: _minor(_amount.text),
                              billingMonth: DateTime.now(),
                              distribution: UtilityDistribution.allActive,
                            ),
                            activeMemberIds: active.map((m) => m.id),
                          );
                          if (mounted) context.pop();
                        } catch (e) {
                          if (mounted)
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text('$e')));
                        } finally {
                          if (mounted) setState(() => _saving = false);
                        }
                      },
                child: Text(
                  _saving ? 'সংরক্ষণ হচ্ছে…' : 'সমানভাবে ভাগ করে সংরক্ষণ',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DepositsPage extends ConsumerWidget {
  const DepositsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final month = ref.watch(currentAccountingMonthProvider);
    return month.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('$e')),
      data: (value) {
        if (value == null)
          return const Center(child: Text('চলমান হিসাবের মাস নেই।'));
        return FutureBuilder<List<Deposit>>(
          future: ref
              .watch(appDatabaseProvider)
              .depositDao
              .depositsForMonth(value.id),
          builder: (context, snap) => ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              AppSectionHeader(
                title: 'জমা',
                actionLabel: '+ জমা',
                onAction: () => context.push(AppRoutes.addDeposit),
              ),
              if (!snap.hasData)
                const Center(child: CircularProgressIndicator())
              else
                ...snap.data!.map(
                  (d) => Card(
                    child: ListTile(
                      title: Text(d.paymentMethod),
                      subtitle: Text(DateFormat.yMMMd().format(d.date)),
                      trailing: Text(_money(d.amountMinor)),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class DepositFormPage extends ConsumerStatefulWidget {
  const DepositFormPage({super.key});
  @override
  ConsumerState<DepositFormPage> createState() => _DepositFormPageState();
}

class _DepositFormPageState extends ConsumerState<DepositFormPage> {
  final _form = GlobalKey<FormState>();
  final _amount = TextEditingController();
  String? _memberId;
  DepositMethod _method = DepositMethod.cash;
  bool _saving = false;
  @override
  void dispose() {
    _amount.dispose();
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
    return StreamBuilder<List<Member>>(
      stream: ref
          .watch(appDatabaseProvider)
          .memberDao
          .watchActiveMembers(mess.value!.id),
      builder: (context, snap) {
        final members = snap.data ?? [];
        return ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            const AppSectionHeader(title: 'জমা যোগ করুন'),
            Form(
              key: _form,
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    value: _memberId,
                    decoration: const InputDecoration(labelText: 'সদস্য'),
                    items: members
                        .map(
                          (m) => DropdownMenuItem(
                            value: m.id,
                            child: Text(m.name),
                          ),
                        )
                        .toList(),
                    onChanged: (v) => setState(() => _memberId = v),
                    validator: (v) => v == null ? 'সদস্য বাছুন' : null,
                  ),
                  DropdownButtonFormField<DepositMethod>(
                    value: _method,
                    decoration: const InputDecoration(labelText: 'পদ্ধতি'),
                    items: DepositMethod.values
                        .map(
                          (m) =>
                              DropdownMenuItem(value: m, child: Text(m.label)),
                        )
                        .toList(),
                    onChanged: (v) => setState(() => _method = v!),
                  ),
                  AppAmountInput(
                    label: 'পরিমাণ',
                    controller: _amount,
                    validator: (v) => _minor(v) <= 0 ? 'সঠিক পরিমাণ দিন' : null,
                  ),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: _saving
                        ? null
                        : () async {
                            if (!_form.currentState!.validate()) return;
                            setState(() => _saving = true);
                            try {
                              await AddDeposit(ref.read(appDatabaseProvider))(
                                id: 'deposit-${DateTime.now().microsecondsSinceEpoch}',
                                draft: DepositDraft(
                                  messId: mess.value!.id,
                                  accountingMonthId: month.value!.id,
                                  memberId: _memberId!,
                                  date: DateTime.now(),
                                  amountMinor: _minor(_amount.text),
                                  method: _method,
                                ),
                              );
                              if (mounted) context.pop();
                            } catch (e) {
                              if (mounted)
                                ScaffoldMessenger.of(
                                  context,
                                ).showSnackBar(SnackBar(content: Text('$e')));
                            } finally {
                              if (mounted) setState(() => _saving = false);
                            }
                          },
                    child: const Text('সংরক্ষণ'),
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

class AdjustmentsPage extends ConsumerWidget {
  const AdjustmentsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final month = ref.watch(currentAccountingMonthProvider);
    return month.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('$e')),
      data: (value) {
        if (value == null)
          return const Center(child: Text('চলমান হিসাবের মাস নেই।'));
        return FutureBuilder<List<MemberAdjustment>>(
          future: ref
              .watch(appDatabaseProvider)
              .adjustmentDao
              .adjustmentsForMonth(value.id),
          builder: (context, snap) => ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              AppSectionHeader(
                title: 'সমন্বয়',
                actionLabel: '+ সমন্বয়',
                onAction: () => context.push(AppRoutes.addAdjustment),
              ),
              if (!snap.hasData)
                const Center(child: CircularProgressIndicator())
              else
                ...snap.data!.map(
                  (a) => Card(
                    child: ListTile(
                      title: Text(a.reason),
                      subtitle: Text(
                        a.direction == 'credit' ? 'ক্রেডিট' : 'ডেবিট',
                      ),
                      trailing: Text(_money(a.amountMinor)),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class AdjustmentFormPage extends ConsumerStatefulWidget {
  const AdjustmentFormPage({super.key});
  @override
  ConsumerState<AdjustmentFormPage> createState() => _AdjustmentFormPageState();
}

class _AdjustmentFormPageState extends ConsumerState<AdjustmentFormPage> {
  final _form = GlobalKey<FormState>();
  final _amount = TextEditingController();
  final _reason = TextEditingController();
  String? _memberId;
  AdjustmentDirection _direction = AdjustmentDirection.debit;
  bool _saving = false;
  @override
  void dispose() {
    _amount.dispose();
    _reason.dispose();
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
    return StreamBuilder<List<Member>>(
      stream: ref
          .watch(appDatabaseProvider)
          .memberDao
          .watchActiveMembers(mess.value!.id),
      builder: (context, snap) {
        final members = snap.data ?? [];
        return ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            const AppSectionHeader(title: 'সমন্বয় যোগ করুন'),
            Form(
              key: _form,
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    value: _memberId,
                    decoration: const InputDecoration(labelText: 'সদস্য'),
                    items: members
                        .map(
                          (m) => DropdownMenuItem(
                            value: m.id,
                            child: Text(m.name),
                          ),
                        )
                        .toList(),
                    onChanged: (v) => setState(() => _memberId = v),
                    validator: (v) => v == null ? 'সদস্য বাছুন' : null,
                  ),
                  DropdownButtonFormField<AdjustmentDirection>(
                    value: _direction,
                    decoration: const InputDecoration(labelText: 'দিক'),
                    items: const [
                      DropdownMenuItem(
                        value: AdjustmentDirection.debit,
                        child: Text('ডেবিট'),
                      ),
                      DropdownMenuItem(
                        value: AdjustmentDirection.credit,
                        child: Text('ক্রেডিট'),
                      ),
                    ],
                    onChanged: (v) => setState(() => _direction = v!),
                  ),
                  AppTextField(
                    label: 'কারণ',
                    controller: _reason,
                    validator: (v) =>
                        v == null || v.trim().isEmpty ? 'কারণ দিন' : null,
                  ),
                  AppAmountInput(
                    label: 'পরিমাণ',
                    controller: _amount,
                    validator: (v) => _minor(v) <= 0 ? 'সঠিক পরিমাণ দিন' : null,
                  ),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: _saving
                        ? null
                        : () async {
                            if (!_form.currentState!.validate()) return;
                            setState(() => _saving = true);
                            try {
                              await AddAdjustment(
                                ref.read(appDatabaseProvider),
                              )(
                                id: 'adjustment-${DateTime.now().microsecondsSinceEpoch}',
                                draft: AdjustmentDraft(
                                  messId: mess.value!.id,
                                  accountingMonthId: month.value!.id,
                                  memberId: _memberId!,
                                  date: DateTime.now(),
                                  amountMinor: _minor(_amount.text),
                                  direction: _direction,
                                  reason: _reason.text,
                                ),
                              );
                              if (mounted) context.pop();
                            } catch (e) {
                              if (mounted)
                                ScaffoldMessenger.of(
                                  context,
                                ).showSnackBar(SnackBar(content: Text('$e')));
                            } finally {
                              if (mounted) setState(() => _saving = false);
                            }
                          },
                    child: const Text('সংরক্ষণ'),
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

int _minor(String? value) =>
    ((double.tryParse(value ?? '') ?? 0) * 100).round();
String _money(int value) => '৳${(value / 100).toStringAsFixed(2)}';
