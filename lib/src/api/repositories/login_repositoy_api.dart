import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginRepositoryApi {
  String url = 'http://192.168.1.248:8080/login';

  Future<List> getPost(String login, String password) async {
    Map<String, dynamic> request = {
      "login": login,
      "password": password,
    };

    var uri = Uri.parse(url);
    var response = await http.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Connection": "Keep-Alive",
      },
      body: json.encode(request),
    );
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
