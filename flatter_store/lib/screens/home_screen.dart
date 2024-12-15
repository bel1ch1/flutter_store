import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Store'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Логика выхода
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => LoginScreen()));
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('products').snapshots(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final products = snapshot.data!.docs.map((doc) {
            return Product(
              id: doc.id,
              title: doc['title'],
              imageUrl: doc['imageUrl'],
              price: doc['price'],
            );
          }).toList();

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
            ),
            itemCount: products.length,
            itemBuilder: (ctx, i) => ProductCard(products[i]),
          );
        },
      ),
    );
  }
}
