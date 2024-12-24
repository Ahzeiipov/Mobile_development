import 'package:flutter/material.dart';
import '../../model/transaction.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class Incomeitem extends StatelessWidget {
  Incomeitem(this.income, {super.key});
  // final Expense expense;
  final Income income;
  final formatter = DateFormat.yMd();
  String get formattedDate => formatter.format(income.date);

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
            income.iconTitle,
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
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              width: 50,
              height: 50,
              child: Icon(
                income.icon,
                color: Colors.white,
              ),
            ),
          ),
          subtitle: Text(income.note),
          trailing: Text(
            ' ${income.amount.toStringAsFixed(2)}\$',
            style: const TextStyle(color: Colors.green, fontSize: 16),
          ),
          // onTap: ,
        ),
      ),
    );
  }
}
