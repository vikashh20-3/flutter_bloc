import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/products_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Product  Screen"),
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
        if (state is ProductsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductsLoadedState) {
          return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(state.productsmodel[index].id.toString()),
                );
              });
        } else if (state is ProductErrorState) {
          return Center(
            child: Text(state.errorMessage),
          );
        }
        return SizedBox();
      }),
    );
  }
}
