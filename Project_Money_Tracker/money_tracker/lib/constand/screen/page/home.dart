import 'package:flutter/material.dart';
import 'chart.dart';
import 'me.dart';
import 'record.dart';
import '../../widget/add.dart';
import '../../model/transaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> body = [];
  List<Expense> expenses = [];
  List<Income> income = [];

  @override
  void initState() {
    super.initState();
    body = [
      Record(expenses: expenses, income: income),
      Chart(expenses: expenses),
      Me(),
    ];
  }

  void onAdd() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => FormTransaction(
        onCreate: (newExpense) {
          setState(() {
            expenses.add(newExpense);
            body[0] = Record(expenses: expenses, income: income);
          });
        },
        onCreateIncome: (newIncome) {
          setState(() {
            income.add(newIncome);
            body[0] = Record(expenses: expenses, income: income);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: body[currentIndex],
      ),
      bottomNavigationBar: bottomNavigation(),
      floatingActionButton: FloatingActionButton(
        onPressed: onAdd,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: const Color.fromARGB(255, 74, 101, 191),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget bottomNavigation() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (int index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.description),
          label: 'Record',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.incomplete_circle_outlined),
          label: 'Charts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Me',
        ),
      ],
      backgroundColor: Colors.white,
      selectedItemColor: const Color.fromARGB(255, 12, 78, 133),
      unselectedItemColor: const Color.fromARGB(255, 74, 101, 191),
    );
  }
}
