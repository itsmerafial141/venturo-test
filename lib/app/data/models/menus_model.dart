// To parse this JSON data, do
//
//     final menusModel = menusModelFromJson(jsonString);

import 'dart:convert';

List<MenusModel> listMenusModelFromJson(String str) =>
    List<MenusModel>.from(json.decode(str).map((x) => MenusModel.fromJson(x)));

String listMenusModelToJson(List<MenusModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

MenusModel menusModelFromJson(String str) =>
    MenusModel.fromJson(json.decode(str));

String menusModelToJson(MenusModel data) => json.encode(data.toJson());

class MenusModel {
  int id;
  String nama;
  int harga;
  String tipe;
  String gambar;

  MenusModel({
    required this.id,
    required this.nama,
    required this.harga,
    required this.tipe,
    required this.gambar,
  });

  factory MenusModel.fromJson(Map<String, dynamic> json) => MenusModel(
        id: json["id"],
        nama: json["nama"],
        harga: json["harga"],
        tipe: json["tipe"],
        gambar: json["gambar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "harga": harga,
        "tipe": tipe,
        "gambar": gambar,
      };
}
