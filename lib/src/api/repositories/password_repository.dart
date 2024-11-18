import 'dart:convert';

import 'package:http/http.dart' as http;

class PasswordRepository {
  String url = 'http://192.168.1.248:8080/recoverPassword/';

  Future<List> put(String password, String email) async {
    Map<String, dynamic> request = {"password": password};

    var uri = Uri.parse(url + email);
    var response = await http.put(uri,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: json.encode(request));
    int codeStatus = response.statusCode;
    Map<String, dynamic> data = json.decode(response.body);

    switch (codeStatus) {
      case 200:
        {
          return [true, 200];
        }
      case 400:
        {
          return [false, data['error'], 400];
        }
      case 500:
        {
          return [false, data['error'], 500];
        }
      default:
        {
          return [false, data['error'], 000];
        }
    }
  }
}
