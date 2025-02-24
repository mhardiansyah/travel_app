import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/Core/models/model.dart';
import 'package:http/http.dart' as http;

class Homecontroller {
  Future getCategory() async {
    var url = dotenv.env['Base_url'];
    Uri urlCategories = Uri.parse("http://172.10.30.25:4000/categories");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Login user = loginFromJson(prefs.getString("Login")!);
    print("User: ${user.token}");
    String token = "Bearer ${user.token}";
    print("Token: $token");

    try {
      print("masuk ke if ");
      final response = await http.get(urlCategories, headers: {
        "Content-Type": "application/json",
        "Authorization": token
      });
      print("Response Status Code: ${response.statusCode}");
      if (response.statusCode == 200) {
        List<Categories> categories = categoriesFromJson(response.body);
        print(categories);
        return categories;
      }
    } on Exception catch (e) {
      throw Exception("Failed to load categories: $e");
    }
  }
}
