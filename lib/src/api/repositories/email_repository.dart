import 'dart:convert';

import 'package:http/http.dart' as http;

class EmailRepository {
  String url = 'http://192.168.1.248:8080/recoverPassword/';

  Future<List> getEmail(String email) async {
    var uri = Uri.parse(url + email);
    var response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    int codeStatus = response.statusCode;
    String token = response.body;
     Map<String, dynamic> data = json.decode(response.body);

    switch (codeStatus) {
      case 200:
        {
          return [true, token, 200];
        }
      case 400:
        {
          return [false,  data['error'], 400];
        }
      case 500:
        {
          return [false,  data['error'], 500];
        }
      default:
        {
          return [false,  data['error'], 000];
        }
    }
  }
}
