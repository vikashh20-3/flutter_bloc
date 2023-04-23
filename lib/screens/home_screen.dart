import 'package:api/screens/product_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Home Screen"),
        ),
        body: Center(
            child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ProductScreen();
                  }));
                },
                child: const Text(
                  "Get Products",
                  style: TextStyle(fontSize: 22),
                ))));
  }
}
