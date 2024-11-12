import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'EX2_part2.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding:  EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProductCard(product: Product.dart),
            ProductCard(product: Product.firebase),
            ProductCard(product: Product.flutter),
          ],
        ),
      ),
    ),
  ));
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 10),
            child: Column(
              children: [
                SizedBox(height: 10),
                Image.asset(
                  product.image,
                  width: 100,
                ),
                SizedBox(height: 10),
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
