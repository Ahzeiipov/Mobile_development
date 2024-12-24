import 'package:flutter/material.dart';
import '../../widget/income/incomeItem.dart';
import '../../widget/expense/expenseItem.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import '../../model/transaction.dart';
import '../../widget/total_value/total_value.dart';

class Record extends StatefulWidget {
  final List<Expense> expenses;
  final List<Income> income;

  const Record({required this.expenses, super.key, required this.income});

  @override
  State<Record> createState() => _RecordState();
}

class _RecordState extends State<Record> {
  void handleDismiss(BuildContext ctx, dynamic transaction) {
    setState(() {
      if (transaction is Expense) {
        widget.expenses.remove(transaction);
      } else if (transaction is Income) {
        widget.income.remove(transaction);
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Undo remove '),
      action: SnackBarAction(
          label: 'undo',
          onPressed: () {
            setState(() {
              if (transaction is Expense) {
                widget.expenses.add(transaction);
              } else if (transaction is Income) {
                widget.income.add(transaction);
              }
              final transactions = [...widget.expenses, ...widget.income];
              transactions.sort((a, b) => b.date.compareTo(a.date));
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final transaction = [...widget.expenses, ...widget.income];
    transaction.sort((a, b) => b.date.compareTo(a.date));
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transaction  ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          TotalValue(expenses: widget.expenses, income: widget.income),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: GroupedListView<dynamic, DateTime>(
                elements: transaction,
                groupBy: (transaction) => DateTime(
                  transaction.date.year,
                  transaction.date.month,
                  transaction.date.day,
                ),
                groupSeparatorBuilder: (DateTime date) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    DateFormat.yMMMMd().format(date),
                  ),
                ),
                itemBuilder: (context, dynamic transaction) {
                  return Dismissible(
                    key: Key(transaction.id.toString()),
                    onDismissed: (direction) {
                      handleDismiss(context, transaction);
                    },
                    background: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.red,
                      ),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 300),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    child: transaction is Expense
                        ? ExpenseItem(transaction)
                        : Incomeitem(transaction),
                  );
                },
                order: GroupedListOrder.DESC,
              ),
            ),
          )
        ],
      ),
    );
  }
}
