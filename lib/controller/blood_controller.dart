import 'package:blodd/model/boold_model.dart';
import 'package:blodd/services/blood_services.dart';
import 'package:flutter/material.dart';

class BloodController extends ChangeNotifier {
  var orderList = BloodModel();
  String? valueDrop;

  var loader = true;
  final MyBloodServices _myBloodServices = MyBloodServices();

  setCHange(String val) {
    valueDrop = val;
    notifyListeners();
  }

  void getDataCalling() async {
    var dataServices = await _myBloodServices.fetchData();
    //notifyListeners();
    orderList = dataServices!;

    loader = false;
notifyListeners();

  }
}
