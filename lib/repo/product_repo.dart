import 'package:api/m/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepo {
  Future<List<ProductModel>> getProducts() async {
    var response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    } else {
      throw Exception("Failed to load exception");
    }
  }
}
