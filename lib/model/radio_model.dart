// To parse this JSON data, do
//
//     final radioModel = radioModelFromJson(jsonString);

import 'dart:convert';

RadioModel radioModelFromJson(String str) => RadioModel.fromJson(json.decode(str));

String radioModelToJson(RadioModel data) => json.encode(data.toJson());

class RadioModel {
  RadioModel({
    this.data,
  });

  List<Datum>  ?data;

  factory RadioModel.fromJson(Map<String, dynamic> json) => RadioModel(
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.isActive,
  });

  int ? id;
  String? name;
  dynamic ?isActive;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "is_active": isActive,
  };
}
