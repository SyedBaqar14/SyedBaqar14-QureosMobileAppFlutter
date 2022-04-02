import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class LoginProvider {

  getLogin({email, password}) async {

    const url = 'https://reqres.in/api/login';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{'Accept': 'application/json'},
        body: ({
          "email": email,
          "password": password
        }),
      );

      final result = json.decode(response.body);

      if (kDebugMode) {
        print(result);
      }
      if (result['token'] is String) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("error: $e");
      return false;
    }
  }
}
