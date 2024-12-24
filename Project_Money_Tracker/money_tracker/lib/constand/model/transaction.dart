import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

abstract class Transaction {
  DateTime get date;

  get id => null;
}

const uuid = Uuid();

class Expense extends Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final String note;
  final IconData icon;
  final String iconTitle;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.note,
    required this.icon,
    required this.iconTitle,
  }) : id = uuid.v4();
  @override
  String toString() {
    return 'Expense {id: $id, title: $title, amount: \$${amount.toStringAsFixed(2)}, date: ${date.toLocal()}, note: $note}';
  }
}

class Income extends Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final String note;
  final IconData icon;
  final String iconTitle;

  Income({
    required this.title,
    required this.amount,
    required this.date,
    required this.note,
    required this.icon,
    required this.iconTitle,
  }) : id = uuid.v4();

  @override
  String toString() {
    return 'Income {id: $id, title: $title, amount: \$${amount.toStringAsFixed(2)}, date: ${date.toLocal()}, note: $note}';
  }
}
