import 'package:flutter/material.dart';

import '../../models/expense.dart';
import 'expenses_form.dart';
import 'expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  //  1. store the expense for temprorarily
  Expense? removeExpense;
  //  2. store the index
  int? indexRemoveExpense;

  void onExpenseRemoved(Expense expense) {
    // Store the removed expense and its index
    setState(() {
      removeExpense = expense;
      indexRemoveExpense = _registeredExpenses.indexOf(expense);
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:const  Text('undo remove the expense'),
        action: SnackBarAction(label: 'undo', onPressed: undoRemove),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void undoRemove() {
    setState(() {
      if (removeExpense != null && indexRemoveExpense != null) {
        _registeredExpenses.insert(indexRemoveExpense!, removeExpense!);
        indexRemoveExpense = null;
        removeExpense = null;
      }
    });
  }

  void onExpenseCreated(Expense newExpense) {
    setState(() {
      _registeredExpenses.add(newExpense);
    });
  }

  void onAddPressed() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => ExpenseForm(onCreated: onExpenseCreated),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: onAddPressed,
          )
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: _registeredExpenses.isEmpty
          ? const Center(
              child: Text(
                'No expense found .Please add some',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )
          : ExpensesList(
              expenses: _registeredExpenses,
              onExpenseRemoved: onExpenseRemoved),
    );
  }
}
