import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;

class HealthState with ChangeNotifier {
  LocalStorage storage = new LocalStorage('usertoken');
  // var token = storage.getItem('token');

  Future<dynamic> health(image) async {
    String url = 'http://192.168.1.131:8000/api/heath_pred/';
    var token = storage.getItem('token');
    Map<String, dynamic> ApiResponse;
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          'Authorization': "token $token"
        },
        body: json.encode({
          "image": image,
        }),
      );
      var data = json.decode(response.body);
      // trouver une autre methode d'encodage
      print(data);
      if (data["error"] == false) {
        return ApiResponse = {"error": true};
      }
      return ApiResponse = data;
      // { "succes": true, "data": data};
    } catch (e) {
      print("e health");
      print(e);
      return false;
    }
  }
}
