import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductScreen extends StatelessWidget {
  final Product product;

  ProductScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Column(
        children: [
          Image.network(product.imageUrl),
          Text('\$${product.price.toStringAsFixed(2)}'),
          ElevatedButton(
            onPressed: () {
              // Добавить в корзину
              // Здесь вы можете добавить логику для добавления товара в корзину
            },
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
