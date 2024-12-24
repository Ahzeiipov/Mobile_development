import 'package:flutter/material.dart';
import 'package:money_tracker/constand/widget/income/incomeItem.dart';
import 'expense/expenseItem.dart';
import '../model/transaction.dart';

class TransactionList extends StatefulWidget {
  const TransactionList(
      {super.key, required this.expenses, required this.income});
  final List<Expense> expenses;
  final List<Income> income;

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    final transaction = [...widget.expenses, ...widget.income];
    transaction.sort((a, b) => b.date.compareTo(a.date));
    return Padding(
      padding: const EdgeInsets.all(30),
      child: ListView.builder(
        itemCount: transaction.length,
        itemBuilder: (ctx, index) {
          final item = transaction[index];
          if (item is Expense) {
            return ExpenseItem(item);
          } else if (item is Income) {
            return Incomeitem(item);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
