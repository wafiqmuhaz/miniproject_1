import 'package:http/http.dart' as http;
import 'package:miniproject_1/model/cart_model.dart';
import 'package:miniproject_1/model/product_model.dart';
import 'dart:convert';

import '../model/user_model.dart';
// class ApiService menangani permintaan HTTP untuk mengambil data pengguna.

class ApiService {
  // baseUrl: URL default/dasar API.
  final String baseUrl = 'https://fakestoreapi.com';

  //FETCH PROFILE USER
  //fetchUser: Mengambil data pengguna dari API.
  Future<User> fetchUser() async {
    final response = await http.get(Uri.parse('$baseUrl/users/1'));
    print("responsefetchUser: ${response.body}");
    if (response.statusCode == 200) {
      // Jika berhasil, akan mengembalikan objek Pengguna yang dibuat dari respons JSON.
      var decodeUser = User.fromJson(json.decode(response.body));
      print("responsedecodeUser: ${decodeUser}");
      return decodeUser;
    } else {
      // Jika gagal, akan muncul 'Gagal mengambil User'.
      throw Exception('Gagal mengambil User');
    }
  }

   Future<CartModel> fetchCart() async {
    final response = await http.get(Uri.parse('$baseUrl/carts/1'));
    print('data api get carts${response}');
    if (response.statusCode == 200) {
       return CartModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load carts');
    }
  }

  Future<List<ProductModel>> getProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((product) => ProductModel.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load Product');
    }
  }

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((product) => ProductModel.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
