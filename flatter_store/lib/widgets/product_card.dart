import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => ProductScreen(product: product),
        ));
      },
      child: Card(
        child: Column(
          children: [
            Image.network(product.imageUrl, fit: BoxFit.cover),
            Text(product.title),
            Text('\$${product.price.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
