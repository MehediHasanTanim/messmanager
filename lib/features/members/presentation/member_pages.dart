// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../app/router/app_router.dart';
import '../../../core/database/app_database.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/widgets/app_content.dart';
import '../../../core/widgets/app_fields.dart';
import '../../accounting/presentation/accounting_providers.dart';
import '../domain/member_models.dart';
import '../domain/member_use_cases.dart';
import 'member_providers.dart';

class MemberListPage extends ConsumerStatefulWidget {
  const MemberListPage({super.key});
  @override
  ConsumerState<MemberListPage> createState() => _MemberListPageState();
}

class _MemberListPageState extends ConsumerState<MemberListPage> {
  String _query = '';
  MemberStatus? _status = MemberStatus.active;

  @override
  Widget build(BuildContext context) {
    final mess = ref.watch(currentMessProvider);
    return mess.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('সদস্য লোড করা যায়নি: $error')),
      data: (currentMess) {
        if (currentMess == null)
          return const Center(child: Text('মেস সেটআপ পাওয়া যায়নি।'));
        final members = ref
            .watch(memberRepositoryProvider)
            .searchMembers(currentMess.id, status: _status, query: _query);
        return StreamBuilder<List<Member>>(
          stream: members,
          builder: (context, snapshot) => ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              AppSectionHeader(
                title: 'সদস্য',
                actionLabel: '+ সদস্য যোগ করুন',
                onAction: () => context.push(AppRoutes.addMember),
              ),
              const SizedBox(height: AppSpacing.sm),
              AppSearchField(
                onChanged: (value) => setState(() => _query = value),
                hintText: 'নাম, ফোন বা রুম খুঁজুন',
              ),
              const SizedBox(height: AppSpacing.sm),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SegmentedButton<MemberStatus?>(
                  segments: const [
                    ButtonSegment(
                      value: MemberStatus.active,
                      label: Text('সক্রিয়'),
                    ),
                    ButtonSegment(
                      value: MemberStatus.inactive,
                      label: Text('নিষ্ক্রিয়'),
                    ),
                    ButtonSegment(
                      value: MemberStatus.left,
                      label: Text('ছেড়েছেন'),
                    ),
                    ButtonSegment(value: null, label: Text('সব')),
                  ],
                  selected: {_status},
                  onSelectionChanged: (value) =>
                      setState(() => _status = value.first),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              if (!snapshot.hasData)
                const Center(child: CircularProgressIndicator())
              else if (snapshot.data!.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(AppSpacing.xl),
                  child: Center(child: Text('কোনো সদস্য পাওয়া যায়নি।')),
                )
              else
                for (final member in snapshot.data!)
                  _MemberListTile(member: member),
            ],
          ),
        );
      },
    );
  }
}

class _MemberListTile extends StatelessWidget {
  const _MemberListTile({required this.member});
  final Member member;
  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(
      leading: AppMemberAvatar(name: member.name),
      title: Text(member.name),
      subtitle: Text(
        [
          if (member.roomNumber != null) 'রুম ${member.roomNumber}',
          _statusText(member.status),
        ].join(' • '),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => context.push('${AppRoutes.members}/${member.id}'),
    ),
  );
}

class MemberFormPage extends ConsumerWidget {
  const MemberFormPage({this.memberId, super.key});
  final String? memberId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (memberId == null) return const _MemberEditor();
    final member = ref.watch(memberProvider(memberId!));
    return member.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('সদস্য পাওয়া যায়নি: $error')),
      data: (data) => data == null
          ? const Center(child: Text('সদস্য পাওয়া যায়নি।'))
          : _MemberEditor(member: data),
    );
  }
}

class _MemberEditor extends ConsumerStatefulWidget {
  const _MemberEditor({this.member});
  final Member? member;
  @override
  ConsumerState<_MemberEditor> createState() => _MemberEditorState();
}

class _MemberEditorState extends ConsumerState<_MemberEditor> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _nickname;
  late final TextEditingController _phone;
  late final TextEditingController _room;
  late final TextEditingController _balance;
  late final TextEditingController _notes;
  late DateTime _joinDate;
  late MemberStatus _status;
  bool _messOwes = false;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final member = widget.member;
    _name = TextEditingController(text: member?.name ?? '');
    _nickname = TextEditingController(text: member?.nickname ?? '');
    _phone = TextEditingController(text: member?.phone ?? '');
    _room = TextEditingController(text: member?.roomNumber ?? '');
    _balance = TextEditingController(
      text: _formatAmount(member?.openingBalanceMinor ?? 0),
    );
    _notes = TextEditingController(text: member?.notes ?? '');
    _joinDate = member?.joinDate ?? DateTime.now();
    _status = member == null
        ? MemberStatus.active
        : MemberStatus.fromDatabase(member.status);
    _messOwes = (member?.openingBalanceMinor ?? 0) > 0;
  }

  @override
  void dispose() {
    for (final controller in [
      _name,
      _nickname,
      _phone,
      _room,
      _balance,
      _notes,
    ])
      controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(widget.member == null ? 'সদস্য যোগ করুন' : 'সদস্য সম্পাদনা'),
    ),
    body: SafeArea(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            const AppSectionHeader(title: 'মূল তথ্য'),
            AppTextField(
              label: 'নাম *',
              controller: _name,
              validator: (value) => value == null || value.trim().isEmpty
                  ? 'নাম দেওয়া আবশ্যক।'
                  : null,
            ),
            AppTextField(label: 'ডাকনাম', controller: _nickname),
            AppTextField(label: 'ফোন', controller: _phone),
            AppTextField(label: 'রুম নম্বর', controller: _room),
            const SizedBox(height: AppSpacing.md),
            const AppSectionHeader(title: 'সদস্যপদ'),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('যোগদানের তারিখ'),
              subtitle: Text(DateFormat.yMMMd().format(_joinDate)),
              trailing: const Icon(Icons.calendar_today_outlined),
              onTap: _pickJoinDate,
            ),
            const SizedBox(height: AppSpacing.md),
            const AppSectionHeader(title: 'শুরুর হিসাব'),
            AppAmountInput(
              label: 'শুরুর ব্যালেন্স',
              controller: _balance,
              validator: _amountError,
            ),
            const SizedBox(height: AppSpacing.xs),
            SegmentedButton<bool>(
              segments: const [
                ButtonSegment(value: false, label: Text('সদস্য মেসকে দেবেন')),
                ButtonSegment(value: true, label: Text('মেস সদস্যকে দেবে')),
              ],
              selected: {_messOwes},
              onSelectionChanged: (value) =>
                  setState(() => _messOwes = value.first),
            ),
            const SizedBox(height: AppSpacing.md),
            AppTextField(label: 'নোট', controller: _notes),
            const SizedBox(height: AppSpacing.lg),
            FilledButton(
              onPressed: _saving ? null : _save,
              child: Text(
                _saving
                    ? 'সংরক্ষণ হচ্ছে…'
                    : widget.member == null
                    ? 'সদস্য যোগ করুন'
                    : 'পরিবর্তন সংরক্ষণ করুন',
              ),
            ),
          ],
        ),
      ),
    ),
  );

  String? _amountError(String? value) =>
      num.tryParse(value?.trim() ?? '') == null &&
          (value?.trim().isNotEmpty ?? false)
      ? 'সঠিক টাকার পরিমাণ দিন।'
      : null;
  Future<void> _pickJoinDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _joinDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null) setState(() => _joinDate = date);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      final mess = await ref.read(currentMessProvider.future);
      if (mess == null) throw StateError('মেস পাওয়া যায়নি।');
      final raw = num.tryParse(_balance.text.trim()) ?? 0;
      final minor = (raw * 100).round() * (_messOwes ? 1 : -1);
      final draft = MemberDraft(
        messId: mess.id,
        name: _name.text,
        nickname: _nickname.text,
        phone: _phone.text,
        roomNumber: _room.text,
        joinDate: _joinDate,
        openingBalanceMinor: minor,
        status: _status,
        notes: _notes.text,
      );
      if (widget.member == null) {
        await AddMember(ref.read(memberRepositoryProvider))(
          id: 'member-${DateTime.now().microsecondsSinceEpoch}',
          draft: draft,
        );
      } else {
        await UpdateMember(ref.read(memberRepositoryProvider))(
          id: widget.member!.id,
          draft: draft,
        );
        ref.invalidate(memberProvider(widget.member!.id));
      }
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

class MemberDetailsPage extends ConsumerWidget {
  const MemberDetailsPage({required this.memberId, super.key});
  final String memberId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final member = ref.watch(memberProvider(memberId));
    final month = ref.watch(currentAccountingMonthProvider);
    return member.when(
      // Keeping the stable route identifier visible while the local database
      // opens also gives deep links a useful, non-animated loading state.
      loading: () => Center(child: Text('Member ID: $memberId')),
      error: (error, _) => Center(child: Text('Member ID: $memberId')),
      data: (data) {
        if (data == null)
          return const Center(child: Text('সদস্য পাওয়া যায়নি।'));
        return ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            Row(
              children: [
                AppMemberAvatar(name: data.name, radius: 32),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.name,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        data.roomNumber == null
                            ? _statusText(data.status)
                            : 'রুম ${data.roomNumber} • ${_statusText(data.status)}',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            month.when(
              loading: () => const LinearProgressIndicator(),
              error: (_, _) => const Text('বর্তমান মাস পাওয়া যায়নি।'),
              data: (current) => current == null
                  ? const Text('বর্তমান হিসাবের মাস নেই।')
                  : _FinancialHero(memberId: memberId, monthId: current.id),
            ),
            const SizedBox(height: AppSpacing.md),
            _ActionTile(
              label: 'আর্থিক সারাংশ',
              icon: Icons.account_balance_wallet_outlined,
              onTap: () =>
                  context.push('${AppRoutes.members}/$memberId/financial'),
            ),
            _ActionTile(
              label: 'মিলের ইতিহাস',
              icon: Icons.restaurant_outlined,
              onTap: () => context.push('${AppRoutes.members}/$memberId/meals'),
            ),
            _ActionTile(
              label: 'জমার ইতিহাস',
              icon: Icons.savings_outlined,
              onTap: () =>
                  context.push('${AppRoutes.members}/$memberId/deposits'),
            ),
            _ActionTile(
              label: 'বাজারে পরিশোধ',
              icon: Icons.shopping_basket_outlined,
              onTap: () =>
                  context.push('${AppRoutes.members}/$memberId/expenses'),
            ),
            _ActionTile(
              label: 'সমন্বয়',
              icon: Icons.tune_outlined,
              onTap: () =>
                  context.push('${AppRoutes.members}/$memberId/adjustments'),
            ),
            _ActionTile(
              label: 'মাসভিত্তিক ইতিহাস',
              icon: Icons.history_outlined,
              onTap: () =>
                  context.push('${AppRoutes.members}/$memberId/history'),
            ),
            const SizedBox(height: AppSpacing.sm),
            OutlinedButton.icon(
              onPressed: () =>
                  context.push('${AppRoutes.members}/$memberId/edit'),
              icon: const Icon(Icons.edit_outlined),
              label: const Text('সদস্য সম্পাদনা'),
            ),
            OutlinedButton.icon(
              onPressed: () =>
                  context.push('${AppRoutes.members}/$memberId/status'),
              icon: Icon(
                data.status == 'active'
                    ? Icons.person_remove_outlined
                    : Icons.person_add_outlined,
              ),
              label: Text(
                data.status == 'active'
                    ? 'নিষ্ক্রিয় / মেস ছাড়ুন'
                    : 'পুনরায় সক্রিয় করুন',
              ),
            ),
          ],
        );
      },
    );
  }
}

class _FinancialHero extends ConsumerWidget {
  const _FinancialHero({required this.memberId, required this.monthId});
  final String memberId;
  final String monthId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(
      memberFinancialSummaryProvider((memberId: memberId, monthId: monthId)),
    );
    return summary.when(
      loading: () => const LinearProgressIndicator(),
      error: (error, _) => Text('$error'),
      data: (data) {
        final balance = data.finalBalance;
        final text = balance.isPositive
            ? 'মেস সদস্যকে দেবে'
            : balance.isNegative
            ? 'সদস্য মেসকে দেবেন'
            : 'হিসাব সমান';
        return AppSummaryCard(
          label: text,
          value: _formatMoney(balance.minorUnits.abs()),
          icon: Icons.account_balance_wallet_outlined,
          color: balance.isNegative ? AppColors.warning : AppColors.success,
        );
      },
    );
  }
}

class MemberRecordsPage extends ConsumerWidget {
  const MemberRecordsPage({
    required this.memberId,
    required this.kind,
    super.key,
  });
  final String memberId;
  final MemberRecordKind kind;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(currentAccountingMonthProvider);
    return current.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('$error')),
      data: (month) {
        if (month == null)
          return const Center(child: Text('বর্তমান হিসাবের মাস নেই।'));
        if (kind == MemberRecordKind.financial)
          return _FinancialSummaryPage(memberId: memberId, monthId: month.id);
        if (kind == MemberRecordKind.history)
          return _MonthlyHistoryPage(memberId: memberId);
        final repo = ref.watch(memberRepositoryProvider);
        return switch (kind) {
          MemberRecordKind.meals => _RecordStreamPage<MealEntry>(
            title: 'মিলের ইতিহাস',
            stream: repo.watchMeals(memberId, month.id),
            tile: (item) => ListTile(
              title: Text(DateFormat.yMMMd().format(item.mealDate)),
              trailing: Text('${item.totalUnits / 100} মিল'),
            ),
          ),
          MemberRecordKind.deposits => _RecordStreamPage<Deposit>(
            title: 'জমার ইতিহাস',
            stream: repo.watchDeposits(memberId, month.id),
            tile: (item) => ListTile(
              title: Text(DateFormat.yMMMd().format(item.date)),
              subtitle: Text(item.paymentMethod),
              trailing: Text(_formatMoney(item.amountMinor)),
            ),
          ),
          MemberRecordKind.expenses => _RecordStreamPage<Expense>(
            title: 'বাজারে পরিশোধ',
            stream: repo.watchExpensesPaid(memberId, month.id),
            tile: (item) => ListTile(
              title: Text(item.description ?? 'বাজার খরচ'),
              subtitle: Text(DateFormat.yMMMd().format(item.date)),
              trailing: Text(_formatMoney(item.amountMinor)),
            ),
          ),
          MemberRecordKind.adjustments => _RecordStreamPage<MemberAdjustment>(
            title: 'সমন্বয়',
            stream: repo.watchAdjustments(memberId, month.id),
            tile: (item) => ListTile(
              title: Text(item.reason),
              subtitle: Text(
                '${DateFormat.yMMMd().format(item.date)} • ${item.direction == 'debit' ? 'ডেবিট' : 'ক্রেডিট'}',
              ),
              trailing: Text(_formatMoney(item.amountMinor)),
            ),
          ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}

enum MemberRecordKind {
  financial,
  meals,
  deposits,
  expenses,
  adjustments,
  history,
}

class _RecordStreamPage<T> extends StatelessWidget {
  const _RecordStreamPage({
    required this.title,
    required this.stream,
    required this.tile,
  });
  final String title;
  final Stream<List<T>> stream;
  final Widget Function(T) tile;
  @override
  Widget build(BuildContext context) => StreamBuilder<List<T>>(
    stream: stream,
    builder: (context, snapshot) => ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        AppSectionHeader(title: title),
        const SizedBox(height: AppSpacing.sm),
        if (!snapshot.hasData)
          const Center(child: CircularProgressIndicator())
        else if (snapshot.data!.isEmpty)
          const Padding(
            padding: EdgeInsets.all(AppSpacing.xl),
            child: Center(child: Text('এই মাসে কোনো রেকর্ড নেই।')),
          )
        else
          for (final record in snapshot.data!) Card(child: tile(record)),
      ],
    ),
  );
}

class _FinancialSummaryPage extends ConsumerWidget {
  const _FinancialSummaryPage({required this.memberId, required this.monthId});
  final String memberId;
  final String monthId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(
      memberFinancialSummaryProvider((memberId: memberId, monthId: monthId)),
    );
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        const AppSectionHeader(title: 'আর্থিক সারাংশ'),
        summary.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Text('$error'),
          data: (data) => Column(
            children: [
              _moneyLine('মিলের খরচ', data.mealCost.minorUnits),
              _moneyLine('সমন্বয় ডেবিট', data.adjustmentDebits.minorUnits),
              _moneyLine('মোট প্রাপ্য', data.totalPayable.minorUnits),
              const Divider(),
              _moneyLine('জমা', data.deposits.minorUnits),
              _moneyLine('বাজারে পরিশোধ', data.expensesPaid.minorUnits),
              _moneyLine('সমন্বয় ক্রেডিট', data.adjustmentCredits.minorUnits),
              _moneyLine('মোট ক্রেডিট', data.totalCredit.minorUnits),
              const Divider(),
              _moneyLine('চূড়ান্ত ব্যালেন্স', data.finalBalance.minorUnits),
            ],
          ),
        ),
      ],
    );
  }

  Widget _moneyLine(String label, int minor) => ListTile(
    contentPadding: EdgeInsets.zero,
    title: Text(label),
    trailing: Text(_formatMoney(minor.abs())),
  );
}

class _MonthlyHistoryPage extends ConsumerWidget {
  const _MonthlyHistoryPage({required this.memberId});
  final String memberId;

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      FutureBuilder<List<MemberMonthlyHistory>>(
        future: ref.watch(memberRepositoryProvider).monthlyHistory(memberId),
        builder: (context, snapshot) => ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            const AppSectionHeader(title: 'মাসভিত্তিক ইতিহাস'),
            if (!snapshot.hasData)
              const Center(child: CircularProgressIndicator())
            else if (snapshot.data!.isEmpty)
              const Padding(
                padding: EdgeInsets.all(AppSpacing.xl),
                child: Center(child: Text('বন্ধ মাসের কোনো ইতিহাস নেই।')),
              )
            else
              for (final item in snapshot.data!)
                Card(
                  child: ListTile(
                    title: Text(
                      DateFormat('MMMM yyyy').format(item.monthStart),
                    ),
                    subtitle: Text('মিল: ${item.mealUnits / 100}'),
                    trailing: Text(_formatMoney(item.finalBalanceMinor.abs())),
                  ),
                ),
          ],
        ),
      );
}

class MemberStatusPage extends ConsumerStatefulWidget {
  const MemberStatusPage({required this.memberId, super.key});
  final String memberId;

  @override
  ConsumerState<MemberStatusPage> createState() => _MemberStatusPageState();
}

class _MemberStatusPageState extends ConsumerState<MemberStatusPage> {
  MemberStatus _status = MemberStatus.left;
  DateTime _leaveDate = DateTime.now();
  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    final member = ref.watch(memberProvider(widget.memberId));
    return member.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('$error')),
      data: (data) {
        if (data == null)
          return const Center(child: Text('সদস্য পাওয়া যায়নি।'));
        final isActive = data.status == MemberStatus.active.databaseValue;
        if (!isActive) _status = MemberStatus.active;
        return ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            AppSectionHeader(
              title: isActive
                  ? 'সদস্যের অবস্থা বদলান'
                  : 'সদস্য পুনরায় সক্রিয় করুন',
            ),
            const SizedBox(height: AppSpacing.md),
            if (isActive) ...[
              const Text(
                'রেকর্ড মুছে যাবে না; আগের মিল, জমা ও হিসাব ইতিহাসে থাকবে।',
              ),
              const SizedBox(height: AppSpacing.sm),
              SegmentedButton<MemberStatus>(
                segments: const [
                  ButtonSegment(
                    value: MemberStatus.inactive,
                    label: Text('নিষ্ক্রিয়'),
                  ),
                  ButtonSegment(
                    value: MemberStatus.left,
                    label: Text('মেস ছেড়েছেন'),
                  ),
                ],
                selected: {_status},
                onSelectionChanged: (value) =>
                    setState(() => _status = value.first),
              ),
              if (_status == MemberStatus.left)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('ছাড়ার তারিখ'),
                  subtitle: Text(DateFormat.yMMMd().format(_leaveDate)),
                  trailing: const Icon(Icons.calendar_today_outlined),
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: _leaveDate,
                      firstDate: data.joinDate,
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) setState(() => _leaveDate = picked);
                  },
                ),
            ] else
              const Text(
                'পুনরায় সক্রিয় করলে সদস্যটি নতুন এন্ট্রির জন্য আবার পাওয়া যাবে।',
              ),
            const SizedBox(height: AppSpacing.lg),
            FilledButton.icon(
              onPressed: _saving ? null : () => _change(data, isActive),
              icon: Icon(
                isActive
                    ? Icons.person_remove_outlined
                    : Icons.person_add_outlined,
              ),
              label: Text(
                _saving
                    ? 'সংরক্ষণ হচ্ছে…'
                    : isActive
                    ? 'অবস্থা বদলান'
                    : 'পুনরায় সক্রিয় করুন',
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _change(Member member, bool isActive) async {
    setState(() => _saving = true);
    try {
      await ChangeMemberStatus(ref.read(memberRepositoryProvider))(
        member.id,
        isActive ? _status : MemberStatus.active,
        leaveDate: isActive && _status == MemberStatus.left ? _leaveDate : null,
      );
      ref.invalidate(memberProvider(widget.memberId));
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

class _ActionTile extends StatelessWidget {
  const _ActionTile({
    required this.label,
    required this.icon,
    required this.onTap,
  });
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(
      leading: Icon(icon),
      title: Text(label),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    ),
  );
}

String _statusText(String status) => switch (status) {
  'active' => 'সক্রিয়',
  'left' => 'মেস ছেড়েছেন',
  _ => 'নিষ্ক্রিয়',
};

String _formatMoney(int minor) => '৳${(minor / 100).toStringAsFixed(2)}';
String _formatAmount(int minor) => (minor.abs() / 100).toStringAsFixed(2);
