import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:venturo/app/data/models/menus_model.dart';
import 'package:venturo/app/data/models/order_model.dart';
import 'package:venturo/app/data/models/vouchers_model.dart';
import 'package:venturo/core/values/keys/end_point_key.dart';
import 'package:venturo/services/api_service.dart';

class MenusProvider extends ApiService {
  Future<List<MenusModel>> menus() async {
    try {
      log("GET Menus");
      var response = await get(
        EndPoint.MENUS,
      );
      log(response.body['status_code'].toString());
      if (response.body['status_code'] != 200) {
        return Future.error(response.body['message']);
      } else {
        return listMenusModelFromJson(jsonEncode(response.body['datas']));
      }
    } catch (e) {
      e.printError();
      return Future.error("Error API!");
    }
  }

  Future<VouchersModel> voucher({required String kode}) async {
    try {
      log("GET Voucher");
      var response = await get(
        "${EndPoint.VOUCHERS}?kode=$kode",
      );
      log(response.body.toString());
      if (response.body['status_code'] != 200) {
        return Future.error(response.body['message']);
      } else {
        return vouchersModelFromJson(jsonEncode(response.body['datas']));
      }
    } catch (e) {
      e.printError();
      return Future.error("Error API!");
    }
  }

  Future<String> order({required OrderModel order}) async {
    try {
      log("POST Order");
      var body = order.toJson();
      body.addAll({
        "id": "000",
      });
      log(order.toJson().toString());
      var response = await post(EndPoint.ORDER, body);
      if (response.body['status_code'] != 200) {
        return Future.error(response.body['message']);
      } else {
        return response.body['message'].toString();
      }
    } catch (e) {
      e.printError();
      return Future.error("Error API!");
    }
  }

  Future<String> cancel({required String id}) async {
    try {
      log("POST Order");
      var response = await post("${EndPoint.CANCEL}/$id", {});
      log(response.body.toString());
      if (response.body['status_code'] != 200) {
        return Future.error(response.body['message']);
      } else {
        return response.body['message'].toString();
      }
    } catch (e) {
      e.printError();
      return Future.error("Error API!");
    }
  }
}
