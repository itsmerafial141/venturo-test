// To parse this JSON data, do
//
//     final vouchersModel = vouchersModelFromJson(jsonString);

import 'dart:convert';

VouchersModel vouchersModelFromJson(String str) =>
    VouchersModel.fromJson(json.decode(str));

String vouchersModelToJson(VouchersModel data) => json.encode(data.toJson());

class VouchersModel {
  int id;
  String kode;
  int nominal;
  DateTime createdAt;
  DateTime updatedAt;

  VouchersModel({
    required this.id,
    required this.kode,
    required this.nominal,
    required this.createdAt,
    required this.updatedAt,
  });

  factory VouchersModel.fromJson(Map<String, dynamic> json) => VouchersModel(
        id: json["id"],
        kode: json["kode"],
        nominal: json["nominal"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kode": kode,
        "nominal": nominal,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
