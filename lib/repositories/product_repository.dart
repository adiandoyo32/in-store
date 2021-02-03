part of 'repositories.dart';

abstract class ProductRepository {
  Future<List<Category>> getProducts();
}

const String apiUrl = 'https://in-store-add.herokuapp.com/api/v1';
// const String apiUrl = 'https://fakestoreapi.com';

class ProductRepositoryImplement implements ProductRepository {
  @override
  Future<List<Category>> getProducts() async {
    try {
      http.Response response = await http.get('$apiUrl/categories');
      if (response.statusCode == 200) {
        List<dynamic> responseJson = jsonDecode(response.body)['data'];
        List<Category> products =
            responseJson.map((product) => Category.fromJson(product)).toList();
        return products;
      }
    } catch (e) {}
  }
}
