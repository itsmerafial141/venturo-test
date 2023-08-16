// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

import 'item_model.dart';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  String nominalDiskon;
  String nominalPesanan;
  List<ItemModel> items;

  OrderModel({
    required this.nominalDiskon,
    required this.nominalPesanan,
    required this.items,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        nominalDiskon: json["nominal_diskon"],
        nominalPesanan: json["nominal_pesanan"],
        items: List<ItemModel>.from(
            json["items"].map((x) => ItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nominal_diskon": nominalDiskon,
        "nominal_pesanan": nominalPesanan,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}
