import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();

  //1. track selected catgory
  Category? _selectedCategory = Category.food;

  //1. create selected date

  DateTime? _selectedDate;

  String get title => _titleController.text;

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void onCancel() {
    // Close modal
    Navigator.pop(context);
  }

  void onAdd() {
    // 1- Get the values from inputs
    String title = _titleController.text;
    double? amount = double.tryParse(_valueController.text);

    // 2 -  Validate the inputs
    bool isTitleValid = title.trim().isNotEmpty;
    bool isAmountValid = amount != null && amount > 0;
    bool valid = isTitleValid && isAmountValid;

    if (valid) {
      // 3.1- Create the expense
      Expense expense = Expense(
          title: title,
          amount: amount,
          // date: DateTime.now(),
          date: _selectedDate ?? DateTime.now(),
          category:
              _selectedCategory ?? Category.food); // use to selected category

      // 3.2- Ask the parent to add the expense
      widget.onCreated(expense);

      // 3.3- Close modal
      Navigator.pop(context);
    } else {
      // 4.1 Compute the error message
      String errorMessage = !isTitleValid
          ? "The title cannot be empty"
          : "The amount shall be a positive number";

      // 4.2 Show error
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> selectedDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025));
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),

          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: _valueController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    prefix: Text('\$ '),
                    label: Text('Amount'),
                  ),
                ),
              ),
              IconButton(
                onPressed: selectedDate,
                icon: const Icon(Icons.calendar_month_outlined),
              )
            ],
          ),
          if (_selectedDate != null)
            Text(
              'Selected Date: ${_selectedDate!.toLocal().toString().split(' ')[0]}', // Display formatted date
              style:const TextStyle(fontSize: 16),
            ),
          // drop down menu
          DropdownButton<Category>(
              value: _selectedCategory,
              items: Category.values.map((Category category) {
                return DropdownMenuItem<Category>(
                    value: category,
                    child: Row(
                      children: [
                        Icon(category.icon),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(category.toString().split('.').last),
                      ],
                    ));
              }).toList(),
              onChanged: (Category? newCategory) {
                setState(() {
                  _selectedCategory = newCategory;
                });
              }),
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: onCancel, child: const Text('Cancel')),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(onPressed: onAdd, child: const Text('Create')),
            ],
          )
        ],
      ),
    );
  }
}
