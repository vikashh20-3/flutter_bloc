import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/products_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    context.read<ProductsBloc>().add(
        ProductsLoadedEvent()); //this context means take this location from anywhere from your project
    super.initState();
  }

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
              itemCount: state.productsmodel.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(state.productsmodel[index].image.toString()),
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
