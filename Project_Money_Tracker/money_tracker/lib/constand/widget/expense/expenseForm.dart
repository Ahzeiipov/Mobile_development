import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import '../model/expense.dart';
import '../../Data/expenseIcon.dart';
import 'dart:math';
import '../../model/transaction.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreate});
  final Function(Expense) onCreate;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  Color randomColors() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(153),
      random.nextInt(102),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: expenseIcon.length,
            itemBuilder: (ctx, index) {
              var icon = expenseIcon[index]['icon'];
              var title = expenseIcon[index]['title'];

              if (icon == null || title == null) {
                return Container(); // Handle null values gracefully
              }

              return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (ctx) => Exform(
                      onCreate: (Expense newExpense) {
                        widget.onCreate(newExpense);
                        Navigator.of(context).pop();
                      },
                      icon: icon,
                      iconTitle: title,
                    ),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: randomColors(),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      width: 70,
                      height: 70,
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Text(title),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Exform extends StatefulWidget {
  const Exform({
    super.key,
    required this.onCreate,
    required this.icon,
    required this.iconTitle,
  });

  final Function(Expense) onCreate;
  final IconData icon;
  final String iconTitle;

  @override
  State<Exform> createState() => _ExformState();
}

class _ExformState extends State<Exform> {
  final TextEditingController _note = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  DateTime? _selectedDate;

  Future<void> selectedDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void cancel() {
    Navigator.pop(context);
  }

  void onAdd() {
    final note = _note.text.trim();
    double? amount = double.tryParse(_amount.text);

    if (note.isEmpty || amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(' ')),
      );
      return;
    }

    Expense expense = Expense(
      title: note,
      amount: amount,
      date: _selectedDate ?? DateTime.now(),
      note: note,
      icon: widget.icon,
      iconTitle: widget.iconTitle,
    );
    widget.onCreate(expense);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            controller: _note,
            decoration: const InputDecoration(labelText: 'Note'),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amount,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(
                    prefix: Text('\$'),
                    labelText: 'Amount',
                  ),
                ),
              ),
              IconButton(
                onPressed: selectedDate,
                icon: const Icon(Icons.calendar_today),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: cancel, child: const Text('Cancel')),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: onAdd, child: const Text('Add')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
