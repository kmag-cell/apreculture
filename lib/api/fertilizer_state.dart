import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;

class FertilizerState with ChangeNotifier {
  LocalStorage storage = LocalStorage('usertoken');
  // var token = storage.getItem('token');

  Future<dynamic> fertlizer(_culture, _nitrogen, _phosphor, _potassium) async {
    String url = 'http://192.168.1.131:8000/api/fertilizer_pred/';
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
          "name_culture": _culture,
          "nitrogen": _nitrogen,
          "phosphor": _phosphor,
          "potassium": _potassium,
        }),
      );
      var data = json.decode(response.body);
      // print(data);
      if (data["error"] == false) {
        return ApiResponse = {"error": true};
      }
      return ApiResponse = data;
      // { "succes": true, "data": data};
    } catch (e) {
      print("e fertilizer");
      print(e);
      return false;
    }
  }
}
