import 'dart:convert';

import 'package:apreculture/models/culturepred_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;

class CultureState with ChangeNotifier {
  LocalStorage storage = new LocalStorage('usertoken');
  // var token = storage.getItem('token');

  Future<dynamic> culture(_nitrogen, _phosphor, _potassium, _temperature,
      _humidity, _ph, _rainfall) async {
    String url = 'http://192.168.1.131:8000/api/prediction_culture/';
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
          "nitrogen": _nitrogen,
          "phosphor": _phosphor,
          "potassium": _potassium,
          "temperature": _temperature,
          "humidity": _humidity,
          "ph": _ph,
          "rainfall": _rainfall,
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
      print("e culture");
      print(e);
      return false;
    }
  }

  List<ImgPredModel> _img_pred = [];

  Future<bool> getImgPred() async {
    String url = 'http://192.168.1.131:8000/api/imgpred/';
    var token = storage.getItem('token');
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Authorization": "token $token",
        },
      );
      var data = json.decode(response.body) as List;
      print(data);

      List<ImgPredModel> temp = [];
      data.forEach((element) {
        ImgPredModel imgpred = ImgPredModel.fromJson(element);
        temp.add(imgpred);
      });
      _img_pred = temp;
      notifyListeners();
      return true;
    } catch (e) {
      print("e getimgpred");
      print(e);
      return false;
    }
  }

  // ImgPredModel singleImgpred(String imagePred) {
  //   return _img_pred.singleWhere((element) => element.imagePred == imagePred);
  // }

  // ImgPredModel singlename(String namePrediction) {
  //   return _img_pred
  //       .singleWhere((element) => element.namePrediction == namePrediction);
  // }
}
