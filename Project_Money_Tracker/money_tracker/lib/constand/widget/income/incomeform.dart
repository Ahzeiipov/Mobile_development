import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Data/incomeIcon.dart';
import 'dart:math';
import '../../model/transaction.dart';

class Incomeform extends StatelessWidget {
  const Incomeform({super.key, required this.onCreateIncome});
  final Function(Income) onCreateIncome;

  get widget => null;
  Color randomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256), // Red
      random.nextInt(153), // Green
      random.nextInt(102), // Blue
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          // Added this line
          child: GridView.builder(
            padding: const EdgeInsets.all(16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: IncomeIcons.length,
            itemBuilder: (ctx, index) {
              var icon = IncomeIcons[index]['icon'];
              var title = IncomeIcons[index]['title'];
              if (icon == null || title == null) {
                return Container(); // Handle null values gracefully
              }
              return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (ctx) => InForm(
                      onCreateIncome: (Income newincome) {
                        onCreateIncome(newincome);
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
                         
                          color: randomColor(),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
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

class InForm extends StatefulWidget {
  const InForm({
    super.key,
    required this.onCreateIncome,
    required this.iconTitle,
    required this.icon,
  });

  final Function(Income) onCreateIncome;
  final IconData icon;
  final String iconTitle;

  @override
  State<InForm> createState() => _InFormState();
}

class _InFormState extends State<InForm> {
  final TextEditingController _note = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  DateTime? _selectedDate;

  Future<void> selectedDate() async {
    DateTime? pickDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );
    if (pickDate != null) {
      setState(() {
        _selectedDate = pickDate;
      });
    }
  }

  void onAdd() {
    final note = _note.text.trim();
    double? amount = double.tryParse(_amount.text);

    if (note.isEmpty || amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please input valid note and amount')),
      );
      return;
    }

    Income income = Income(
      title: note,
      amount: amount,
      date: _selectedDate ?? DateTime.now(),
      note: note,
      icon: widget.icon,
      iconTitle: widget.iconTitle,
    );

    widget.onCreateIncome(income);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        children: [
          TextField(
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
                ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel')),
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
