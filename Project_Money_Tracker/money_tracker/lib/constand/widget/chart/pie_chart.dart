import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../model/transaction.dart';

class ExpensePieChart extends StatelessWidget {
  final List<Expense> expenses;

  ExpensePieChart({required this.expenses});

  @override
  Widget build(BuildContext context) {
    double totalExpenses =
        expenses.fold(0, (sum, expense) => sum + expense.amount);

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: AspectRatio(
        aspectRatio: 4,
        child: Stack(
          children: [
            PieChart(
              PieChartData(
                sections: _getChartSections(),
                borderData: FlBorderData(show: false),
                sectionsSpace: 0,
                centerSpaceRadius:
                    30, 
              ),
            ),
            Center(
              child: Text(
                '\$${totalExpenses.toStringAsFixed(2)}', 
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> _getChartSections() {
    Map<String, double> categoryTotals = {};

    for (var expense in expenses) {
      categoryTotals[expense.iconTitle] =
          (categoryTotals[expense.iconTitle] ?? 0) + expense.amount;
    }

    List<PieChartSectionData> sections = [];
    int index = 0;

    categoryTotals.forEach((category, total) {
      sections.add(
        PieChartSectionData(
          color: _getColor(index),
          value: total,
          title: '', 
          radius: 60,
        ),
      );
      index++;
    });

    return sections;
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
