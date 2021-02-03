part of 'api_services.dart';

// const String apiUrl = 'https://in-store-add.herokuapp.com/api/v1';
const String apiUrl = 'https://fakestoreapi.com';

class ProductApiService {
  Future<List<Product>> getProducts() async {
    try {
      http.Response response = await http.get('$apiUrl/products');

      print(response.statusCode);
      if (response.statusCode == 200) {
        List<dynamic> responseJson = jsonDecode(response.body);
        print(responseJson.runtimeType);
        List<Product> products = [];
        responseJson.forEach((product) {
          products.add(Product.fromJson(product));
        });
        // print(products.runtimeType);
        return products;
      }
      throw Exception('not 2xx response code, i dunno');
    } catch (e) {
      print(e);
    }
  }
}
