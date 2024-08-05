import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/product.dart';

class ApiService {
  static const String _baseUrl = 'https://dummyjson.com';

  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$_baseUrl/products'));
    if (response.statusCode == 200) {
      final List<dynamic> productList = json.decode(response.body)['products'];
      return productList.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
