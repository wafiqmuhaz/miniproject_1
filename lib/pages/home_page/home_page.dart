import 'package:flutter/material.dart';

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
        ],
      ),
      body: Container(),
    );
  }
}
