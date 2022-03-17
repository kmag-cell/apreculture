import 'dart:convert';
import 'package:apreculture/models/stock_model.dart';
import 'package:apreculture/pages/home/component/plant.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class StockState with ChangeNotifier {
  LocalStorage storage = LocalStorage('usertoken');

  List<StockModel> _stock = [];

  Future<bool> getStock() async {
    String url = 'http://192.168.1.131:8000/api/stock/';
    var token = storage.getItem('token');
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Authorization": "token $token",
        },
      );
      var data = json.decode(response.body) as List;
      // print(data);

      List<StockModel> temp = [];
      data.forEach((element) {
        StockModel stock = StockModel.fromJson(element);
        temp.add(stock);
      });
      _stock = temp;
      notifyListeners();
      return true;
    } catch (e) {
      print("e getstock");
      print(e);
      return false;
    }
  }

  List<StockModel> get stock {
    return [..._stock];
  }

  // StockModel singleStock(int id) {
  //   return _stock.firstWhere((element) => element.id == id);
  // }
}
