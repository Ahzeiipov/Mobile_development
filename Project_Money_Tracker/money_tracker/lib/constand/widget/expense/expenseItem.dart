import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import '../../model/transaction.dart';

class ExpenseItem extends StatelessWidget {
  ExpenseItem(this.expense, {super.key});
  final Expense expense;
  final formatter = DateFormat.yMd();
  String get formattedDate => formatter.format(expense.date);

  Color randomColors() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(150),
      random.nextInt(150) + 100,
      random.nextInt(80),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
        ),
        child: ListTile(
          title: Text(
            expense.iconTitle,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(right: 13, left: 10),
            child: Container(
              decoration: BoxDecoration(
                color: randomColors(),
                borderRadius:const BorderRadius.all(Radius.circular(10)),
              ),
              width: 50,
              height: 50,
              child: Icon(
                expense.icon,
                color: Colors.white,
              ),
            ),
          ),
          subtitle: Text(expense.note),
          trailing: Text(
            '- ${expense.amount.toStringAsFixed(2)}\$',
            style: const TextStyle(color: Colors.red, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
