import 'package:flutter/material.dart';

class ExpenseBreakdown extends StatelessWidget {
  final Map<String, double> categoryTotals;
  final Map<String, Color> categoryColors; 
  final Map<String, IconData> categoryIcons; 

  const ExpenseBreakdown({
    super.key,
    required this.categoryTotals,
    required this.categoryColors, 
    required this.categoryIcons, 
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categoryTotals.length,
      itemBuilder: (context, index) {
        String category = categoryTotals.keys.elementAt(index);
        double amount = categoryTotals[category]!;
        double percentage =
            (amount / categoryTotals.values.reduce((a, b) => a + b)) * 100;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: categoryColors[category],
                ),
                width: 50, 
                height: 50, 
                child: Center(
                  child: Icon(
                    categoryIcons[category], 
                    size: 16, 
                    color: Colors.white, 
                  ),
                ),
              ),
              const SizedBox(width: 10), 
              Expanded(
                child: ListTile(
                  title: Text(category),
                  trailing: Text(
                    '\$${amount.toStringAsFixed(2)} (${percentage.toStringAsFixed(2)}%)',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
