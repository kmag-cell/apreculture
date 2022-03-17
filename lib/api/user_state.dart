import 'dart:convert';
import 'package:apreculture/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class UserState with ChangeNotifier {
  LocalStorage storage = LocalStorage('usertoken');

  Future<bool> loginNow(String username, String passw) async {
    String url = 'http://192.168.1.131:8000/api/login/';
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({"username": username, "password": passw}));
      var data = json.decode(response.body);

      print(data);

      if (data.containsKey("token")) {
        storage.setItem("token", data['token']);

        print(storage.getItem('token'));
        return true;
      }
      return false;
    } catch (e) {
      print("e loginNow");
      print(e);
      return false;
    }
  }

  Future<bool> registernow(
    String fname,
    String lname,
    String email,
    String number,
    String uname,
    String passw,
    String locale,
  ) async {
    String url = 'http://192.168.1.131:8000/api/register/';
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({
            'first_name': fname,
            'last_name': lname,
            'email': email,
            "number": number,
            "username": uname,
            "password": passw,
            "location": locale,
          }));
      var data = json.decode(response.body);
      print(data);

      if (data["error"] == false) {
        return false;
      }
      return true;
    } catch (e) {
      print("e loginNow");
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser() async {
    String url = 'http://192.168.1.131:8000/api/profile/';
    var token = storage.getItem('token');
    final response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization": "token $token",
      },
    );
    var data = json.decode(response.body);
    print(data);

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user info');
    }
  }
}
