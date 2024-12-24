import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'expense/expenseForm.dart';
import 'income/incomeform.dart';
import '../model/transaction.dart';

class FormTransaction extends StatefulWidget {
  const FormTransaction({
    super.key,
    required this.onCreate,
    required this.onCreateIncome,
  });
  final Function(Expense) onCreate;
  final Function(Income) onCreateIncome;
  @override
  State<FormTransaction> createState() => _FormTransactionState();
}

class _FormTransactionState extends State<FormTransaction> {
  int? selectedSegment = 0;

  void onCancel() {
    // Close modal
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {  
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 10),
              TextButton(onPressed: onCancel, child: const Text('Cancel')),
              const SizedBox(width: 50),
              CupertinoSlidingSegmentedControl<int>(
                children: {
                  0: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'Expense',
                      style: TextStyle(
                        color:
                            selectedSegment == 0 ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  1: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Income',
                      style: TextStyle(
                        color:
                            selectedSegment == 1 ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                },
                thumbColor: const Color.fromARGB(255, 74, 101, 191),
                backgroundColor: Colors.white,
                groupValue: selectedSegment,
                onValueChanged: (int? newSegment) {
                  setState(() {
                    selectedSegment = newSegment;
                  });
                },
              ),
            ],
          ),
          Expanded(
            child: selectedSegment == 0
                ? ExpenseForm(onCreate: widget.onCreate)
                : Incomeform(
                    onCreateIncome: widget.onCreateIncome,
                  ),
          ),
        ],
      ),
    );
  }
}
