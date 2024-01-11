// To parse this JSON data, do
//
//     final busModel = busModelFromJson(jsonString);

import 'dart:convert';

BusModel busModelFromJson(String str) => BusModel.fromJson(json.decode(str));

String busModelToJson(BusModel data) => json.encode(data.toJson());

class BusModel {
  int id;
  String image;
  String name;
  String type;
  String driverName;
  String driverLicenseNo;

  BusModel({
    required this.id,
    required this.image,
    required this.name,
    required this.type,
    required this.driverName,
    required this.driverLicenseNo,
  });

  factory BusModel.fromJson(Map<String, dynamic> json) => BusModel(
    id: json["id"],
    image: json["image"],
    name: json["name"],
    type: json["type"],
    driverName: json["driver_name"],
    driverLicenseNo: json["driver_license_no"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "name": name,
    "type": type,
    "driver_name": driverName,
    "driver_license_no": driverLicenseNo,
  };
}
