import 'dart:convert';

import 'package:http/http.dart' as http;

import '../modal/product_item.dart';

class RemoteServices {
  Future<List<Product>> getProductData() async {
    List<Product> listproduct = [];

    final client = http.Client();

    var url = Uri.parse('https://fakestoreapi.com/products');

    http.Response response = await client.get(url);

    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body);
      json.forEach((element) {
        Product product = Product.fromJson(element);
        listproduct.add(product);
      });

      return listproduct;
    }
    return [];
  }
}
