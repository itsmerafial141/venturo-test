// To parse this JSON data, do
//
//     final itemModel = itemModelFromJson(jsonString);

import 'dart:convert';

List<ItemModel> listItemModelFromJson(String str) =>
    List<ItemModel>.from(json.decode(str).map((x) => ItemModel.fromJson(x)));

String listItemModelToJson(List<ItemModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

ItemModel itemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));

String itemModelToJson(ItemModel data) => json.encode(data.toJson());

class ItemModel {
  int id;
  int harga;
  String catatan;

  ItemModel({
    required this.id,
    required this.harga,
    required this.catatan,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        id: json["id"],
        harga: json["harga"],
        catatan: json["catatan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "harga": harga,
        "catatan": catatan,
      };
}
