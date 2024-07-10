import 'package:flutter/material.dart';
import 'package:miniproject_1/pages/cart_page/cart_screen.dart';
import 'package:miniproject_1/pages/product_page/product_page.dart';

import '../user_page/user_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My E-commerce App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.shopping_basket,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        ],
      ),
      body: const ProductPage(),
    );
  }
}
