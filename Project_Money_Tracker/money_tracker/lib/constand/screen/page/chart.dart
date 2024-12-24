import 'package:flutter/material.dart';
import '../../widget/chart/pie_chart.dart';
import '../../model/transaction.dart';
import '../../widget/chart/breakdown.dart';

class Chart extends StatelessWidget {
  final List<Expense> expenses;

  const Chart({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    // Grouping expenses by category
    Map<String, double> categoryTotals = {};
    Map<String, Color> categoryColors = {};
    Map<String, IconData> categoryIcons = {}; 

    for (var expense in expenses) {
      categoryTotals[expense.iconTitle] =
          (categoryTotals[expense.iconTitle] ?? 0) + expense.amount;

      // Assign colors based on category
      if (!categoryColors.containsKey(expense.iconTitle)) {
        categoryColors[expense.iconTitle] = _getColor(categoryColors.length);
      }
      if (!categoryIcons.containsKey(expense.iconTitle)) {
        categoryIcons[expense.iconTitle] = expense
            .icon; 
      }
    }

    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Chart', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ExpensePieChart(expenses: expenses),
            ),
            Expanded(
              flex: 2,
              child: ExpenseBreakdown(
                categoryTotals: categoryTotals,
                categoryColors: categoryColors, 
                categoryIcons: categoryIcons, 
              ),
            ),
          ],
        ),
      ),
    );
  }


  Color _getColor(int index) {
    const List<Color> colors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.yellow,
    ];
    return colors[index % colors.length];
  }
}
