import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/user_model.dart';
class ApiService {
  final String baseUrl = 'https://fakestoreapi.com';

  //FETCH PROFILE USER
  Future<User> fetchUser() async {
    final response = await http.get(Uri.parse('$baseUrl/users/1'));
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }
}
