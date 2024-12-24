import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/transaction.dart';
import '../../model/balance_Model.dart';

class TotalValue extends StatelessWidget {
  const TotalValue({super.key, required this.expenses, required this.income});
  final List<Expense> expenses;
  final List<Income> income;

  @override
  Widget build(BuildContext context) {
    double totalIncome = income.fold(0, (sum, item) => sum + item.amount);
    double totalExpense = expenses.fold(0, (sum, item) => sum + item.amount);
    double userDefinedTotalBalance =
        Provider.of<BalanceModel>(context).totalBalance;

    double totalBalance = userDefinedTotalBalance - totalExpense;

    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 50, top: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color.fromARGB(255, 74, 101, 191),
              ),
              width: 100,
              height: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => showBalanceInputDialog(context),
                    icon: const Icon(
                      Icons.wallet,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Text(
                '${totalBalance.toStringAsFixed(2)} \$',
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin:const EdgeInsets.only(left: 50, top: 20),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromARGB(255, 74, 101, 191)),
                width: 110,
                height: 35,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Income',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Text(
                '${totalIncome.toStringAsFixed(2)} \$',
                style:const
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        // Income and Expense columns...
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(left: 50, top: 20),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromARGB(255, 74, 101, 191)),
                width: 110,
                height: 35,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Expanse',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Text(
                '${totalExpense.toStringAsFixed(2)} \$',
                style:const
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ],
    );
  }

  void showBalanceInputDialog(BuildContext context) {
    final TextEditingController _balanceController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Total Balance'),
          content: TextField(
            controller: _balanceController,
            decoration: const InputDecoration(
              labelText: 'Input Budget',
              prefixText: '\$',
            ),
            keyboardType: TextInputType.number,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                double newBalance =
                    double.tryParse(_balanceController.text) ?? 0.0;
                Provider.of<BalanceModel>(context, listen: false)
                    .updateBalance(newBalance);
                Navigator.of(context).pop(); 
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
