// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:io';

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
import '../domain/expense_models.dart';
import '../domain/expense_use_cases.dart';

class ExpenseHomePage extends ConsumerWidget {
  const ExpenseHomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mess = ref.watch(currentMessProvider);
    final month = ref.watch(currentAccountingMonthProvider);
    if (!mess.hasValue || !month.hasValue)
      return const Center(child: CircularProgressIndicator());
    if (mess.value == null || month.value == null)
      return const Center(child: Text('চলমান হিসাবের মাস নেই।'));
    SeedSystemExpenseCategories(ref.watch(appDatabaseProvider))(mess.value!.id);
    return FutureBuilder<ExpenseSummary>(
      future: GetExpenseSummary(ref.watch(appDatabaseProvider))(
        month.value!.id,
      ),
      builder: (context, snapshot) => ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          AppSectionHeader(
            title: 'বাজার / খরচ',
            actionLabel: 'সব দেখুন',
            onAction: () => context.push(AppRoutes.expenseList),
          ),
          if (snapshot.hasData) ...[
            AppSummaryCard(
              label: 'মিলের খরচ',
              value: _money(snapshot.data!.mealExpenseMinor),
              icon: Icons.shopping_basket_outlined,
            ),
            AppSummaryCard(
              label: 'অন্যান্য খরচ',
              value: _money(snapshot.data!.sharedExpenseMinor),
              icon: Icons.receipt_long_outlined,
            ),
          ],
          const SizedBox(height: AppSpacing.sm),
          FilledButton.icon(
            onPressed: () =>
                context.push('${AppRoutes.addExpense}?type=mealExpense'),
            icon: const Icon(Icons.add_shopping_cart),
            label: const Text('বাজার যোগ করুন'),
          ),
          OutlinedButton.icon(
            onPressed: () =>
                context.push('${AppRoutes.addExpense}?type=sharedExpense'),
            icon: const Icon(Icons.add_card),
            label: const Text('শেয়ার্ড খরচ যোগ করুন'),
          ),
          OutlinedButton.icon(
            onPressed: () =>
                context.push('${AppRoutes.addExpense}?payer=member'),
            icon: const Icon(Icons.person_outline),
            label: const Text('সদস্যের দেওয়া খরচ'),
          ),
          OutlinedButton.icon(
            onPressed: () => context.push(AppRoutes.expenseCategories),
            icon: const Icon(Icons.category_outlined),
            label: const Text('ক্যাটাগরি'),
          ),
        ],
      ),
    );
  }
}

class ExpenseListPage extends ConsumerStatefulWidget {
  const ExpenseListPage({super.key});
  @override
  ConsumerState<ExpenseListPage> createState() => _ExpenseListPageState();
}

class _ExpenseListPageState extends ConsumerState<ExpenseListPage> {
  String _query = '';
  @override
  Widget build(BuildContext context) {
    final month = ref.watch(currentAccountingMonthProvider);
    return month.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('$error')),
      data: (value) {
        if (value == null)
          return const Center(child: Text('চলমান হিসাবের মাস নেই।'));
        return FutureBuilder<List<Expense>>(
          future: SearchExpenses(ref.watch(appDatabaseProvider))(
            value.id,
            query: _query,
          ),
          builder: (context, snapshot) => ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              AppSectionHeader(
                title: 'খরচের তালিকা',
                actionLabel: '+ যোগ করুন',
                onAction: () => context.push(AppRoutes.addExpense),
              ),
              AppSearchField(
                onChanged: (value) => setState(() => _query = value),
                hintText: 'বিবরণ বা বিক্রেতা খুঁজুন',
              ),
              if (!snapshot.hasData)
                const Center(child: CircularProgressIndicator())
              else
                for (final expense in snapshot.data!)
                  Card(
                    child: ListTile(
                      title: Text(expense.description ?? 'খরচ'),
                      subtitle: Text(DateFormat.yMMMd().format(expense.date)),
                      trailing: Text(_money(expense.amountMinor)),
                      onTap: () => context.push(
                        '${AppRoutes.expenseList}/${expense.id}',
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

class ExpenseFormPage extends ConsumerStatefulWidget {
  const ExpenseFormPage({
    this.id,
    this.initialType,
    this.memberPaid = false,
    super.key,
  });
  final String? id;
  final String? initialType;
  final bool memberPaid;
  @override
  ConsumerState<ExpenseFormPage> createState() => _ExpenseFormPageState();
}

class _ExpenseFormPageState extends ConsumerState<ExpenseFormPage> {
  final _form = GlobalKey<FormState>();
  final _amount = TextEditingController();
  final _description = TextEditingController();
  final _vendor = TextEditingController();
  final _receipt = TextEditingController();
  DateTime _date = DateTime.now();
  String? _category;
  String? _payer;
  bool _saving = false;
  @override
  void dispose() {
    _amount.dispose();
    _description.dispose();
    _vendor.dispose();
    _receipt.dispose();
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
    return FutureBuilder<List<ExpenseCategory>>(
      future: ref
          .watch(appDatabaseProvider)
          .expenseDao
          .categoriesForMess(mess.value!.id, activeOnly: true),
      builder: (context, snapshot) {
        final all = snapshot.data ?? const <ExpenseCategory>[];
        final categories = widget.initialType == null
            ? all
            : all.where((item) => item.type == widget.initialType).toList();
        if (_category == null && categories.isNotEmpty)
          _category = categories.first.id;
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.id == null ? 'খরচ যোগ করুন' : 'খরচ সম্পাদনা'),
          ),
          body: Form(
            key: _form,
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.md),
              children: [
                DropdownButtonFormField<String>(
                  initialValue: _category,
                  decoration: const InputDecoration(labelText: 'ক্যাটাগরি'),
                  items: [
                    for (final item in categories)
                      DropdownMenuItem(
                        value: item.id,
                        child: Text(item.nameBn ?? item.name),
                      ),
                  ],
                  onChanged: (value) => setState(() => _category = value),
                  validator: (value) =>
                      value == null ? 'ক্যাটাগরি বাছুন' : null,
                ),
                AppAmountInput(
                  label: 'পরিমাণ',
                  controller: _amount,
                  validator: (value) => (num.tryParse(value ?? '') ?? 0) <= 0
                      ? 'সঠিক পরিমাণ দিন'
                      : null,
                ),
                AppTextField(label: 'বিবরণ', controller: _description),
                AppTextField(label: 'বিক্রেতা', controller: _vendor),
                if (widget.memberPaid)
                  FutureBuilder<List<Member>>(
                    future: ref
                        .watch(appDatabaseProvider)
                        .mealDao
                        .eligibleMembersForDate(mess.value!.id, _date),
                    builder: (context, members) =>
                        DropdownButtonFormField<String>(
                          initialValue: _payer,
                          decoration: const InputDecoration(
                            labelText: 'কে পরিশোধ করেছেন',
                          ),
                          items: [
                            for (final member
                                in members.data ?? const <Member>[])
                              DropdownMenuItem(
                                value: member.id,
                                child: Text(member.name),
                              ),
                          ],
                          onChanged: (value) => setState(() => _payer = value),
                          validator: (value) =>
                              value == null ? 'সদস্য বাছুন' : null,
                        ),
                  ),
                AppTextField(
                  label: 'রসিদের ফাইল পাথ (ঐচ্ছিক)',
                  controller: _receipt,
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
      await AddExpense(ref.read(appDatabaseProvider))(
        id: widget.id ?? 'expense-${DateTime.now().microsecondsSinceEpoch}',
        draft: ExpenseDraft(
          messId: messId,
          accountingMonthId: monthId,
          date: _date,
          categoryId: _category!,
          amountMinor: (num.parse(_amount.text) * 100).round(),
          description: _description.text,
          vendor: _vendor.text,
          paidByMemberId: widget.memberPaid ? _payer : null,
          receiptPath: _receipt.text,
        ),
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

class ExpenseDetailsPage extends ConsumerWidget {
  const ExpenseDetailsPage({required this.id, super.key});
  final String id;
  @override
  Widget build(BuildContext context, WidgetRef ref) => FutureBuilder<Expense?>(
    future: ref.watch(appDatabaseProvider).expenseDao.expenseById(id),
    builder: (context, snapshot) {
      final item = snapshot.data;
      if (!snapshot.hasData)
        return const Center(child: CircularProgressIndicator());
      if (item == null) return const Center(child: Text('খরচটি পাওয়া যায়নি।'));
      return ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          const AppSectionHeader(title: 'খরচের বিবরণ'),
          AppSummaryCard(
            label: item.description ?? 'খরচ',
            value: _money(item.amountMinor),
            icon: Icons.receipt_long_outlined,
          ),
          if (item.paidByMemberId != null)
            const AppStatusBadge(
              label: 'সদস্যের দেওয়া — জমা তৈরি হয়নি',
              status: AppStatus.info,
            ),
          if (item.receiptPath != null)
            _ReceiptPreview(path: item.receiptPath!),
          OutlinedButton.icon(
            onPressed: () =>
                context.push('${AppRoutes.expenseList}/${item.id}/edit'),
            icon: const Icon(Icons.edit_outlined),
            label: const Text('সম্পাদনা'),
          ),
        ],
      );
    },
  );
}

class _ReceiptPreview extends StatelessWidget {
  const _ReceiptPreview({required this.path});
  final String path;
  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(
      leading: const Icon(Icons.image_outlined),
      title: const Text('রসিদ'),
      subtitle: Text(path),
      onTap: () {
        final file = File(path);
        if (file.existsSync())
          showDialog(
            context: context,
            builder: (_) => Dialog(child: Image.file(file)),
          );
      },
    ),
  );
}

class ExpenseCategoriesPage extends ConsumerWidget {
  const ExpenseCategoriesPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mess = ref.watch(currentMessProvider);
    if (!mess.hasValue || mess.value == null)
      return const Center(child: CircularProgressIndicator());
    return FutureBuilder<List<ExpenseCategory>>(
      future: ref
          .watch(appDatabaseProvider)
          .expenseDao
          .categoriesForMess(mess.value!.id),
      builder: (context, snapshot) => ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          const AppSectionHeader(title: 'ক্যাটাগরি'),
          if (!snapshot.hasData)
            const Center(child: CircularProgressIndicator())
          else
            for (final category in snapshot.data!)
              Card(
                child: ListTile(
                  title: Text(category.nameBn ?? category.name),
                  subtitle: Text(category.type),
                  trailing: category.isSystem
                      ? const AppStatusBadge(
                          label: 'সিস্টেম',
                          status: AppStatus.neutral,
                        )
                      : null,
                ),
              ),
        ],
      ),
    );
  }
}

String _money(int minor) => '৳${(minor / 100).toStringAsFixed(2)}';
