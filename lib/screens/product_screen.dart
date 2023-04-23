import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Product  Screen"),
      ),
      body: ListView.builder(itemBuilder: ((context, index) {
        return ListTile();
      })),
    );
  }
}
