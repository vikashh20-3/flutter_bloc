import 'package:api/m/model/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../repo/product_repo.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsLoadedEvent, ProductsState> {
  final ProductRepo productRepo;
  ProductsBloc(this.productRepo) : super(ProductsLoadingState()) {
    on<ProductsLoadedEvent>((event, emit) async {
      try {
        emit(ProductsLoadingState());
        var data = await productRepo.getProducts();

        emit(ProductsLoadedState(data));
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
    });
  }
}

// class ProductsBloc extends Bloc<ProductsLoadedEvent, ProductsState> {
//   final ProductRepo productRepo;
//   ProductsBloc() : super(ProductsLoadingState()) {
//     on<ProductsLoadedEvent>((event, emit) async {
//       try {
//         emit(ProductsLoadingState());
//         var response =
//             await http.get(Uri.parse("https://fakestoreapi.com/products"));
//         if (response.statusCode == 200) {
//           emit(ProductsLoadedState(productModelFromJson(response.body)));
//         } else {
//           throw Exception("Failed to load exception");
//         }
//       } catch (e) {
//         emit(ProductErrorState(e.toString()));
//       }
//     });
//   }
// }


