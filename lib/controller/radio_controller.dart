import 'package:blodd/model/boold_model.dart';
import 'package:blodd/model/radio_model.dart';
import 'package:blodd/services/blood_services.dart';
import 'package:blodd/services/radio_services.dart';
import 'package:flutter/material.dart';

class RadioController extends ChangeNotifier {
  var radioList = RadioModel();
  String? valueDrop;

  var loader = true;
  final MyRadioServices _myRadioServices = MyRadioServices();

  setCHange(String val) {
    valueDrop = val;
    notifyListeners();
  }

  void getDataCalling() async {
    var dataServices = await _myRadioServices.fetchData();
    //notifyListeners();
    radioList = dataServices!;

    loader = false;
    notifyListeners();
  }
}
