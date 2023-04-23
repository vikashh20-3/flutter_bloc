part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsLoadedState extends ProductsState {
  final List<ProductModel> productsmodel;

  const ProductsLoadedState(this.productsmodel);
  @override
  List<Object> get props => [productsmodel];
}

class ProductErrorState extends ProductsState {
  final String errorMessage;
  const ProductErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
