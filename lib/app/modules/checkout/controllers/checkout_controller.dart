import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:venturo/app/data/models/item_model.dart';
import 'package:venturo/app/data/models/menus_model.dart';
import 'package:venturo/app/data/models/order_model.dart';
import 'package:venturo/app/data/models/vouchers_model.dart';
import 'package:venturo/app/data/providers/menus_provider.dart';
import 'package:venturo/app/routes/app_pages.dart';
import 'package:venturo/app/widgets/my_default_button_widget.dart';
import 'package:venturo/app/widgets/my_divider_widget.dart';
import 'package:venturo/app/widgets/my_double_button_dialog_widget.dart';
import 'package:venturo/app/widgets/my_loading_widget.dart';
import 'package:venturo/app/widgets/my_raw_snackbar.dart';
import 'package:venturo/core/fonts/fonts.dart';
import 'package:venturo/core/utils/helpers.dart';
import 'package:venturo/core/values/keys/response_code_key.dart';

import '../../../../core/values/const/double_const.dart';

class CheckoutController extends GetxController
    with StateMixin<List<MenusModel>> {
  final MenusProvider _menusProvider = Get.put(MenusProvider());

  var voucherController = TextEditingController();
  late VouchersModel voucher;
  late List<MenusModel> menus;

  late OrderModel order;

  var isCheckout = false.obs;

  @override
  void onInit() {
    _initiaalizeData();
    super.onInit();
  }

  void _initiaalizeData() async {
    menus = [];
    order = OrderModel(
      nominalDiskon: "0",
      nominalPesanan: "0",
      items: [],
    );
    await _menusProvider.menus().then((response) {
      if (response.isNotEmpty) {
        menus = response;
        change(response, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  void onPesanTapped() {
    if (order.items.isEmpty) {
      MyRawSnackBar.rawSanckBar(
        statusCode: RespCode.ERROR,
        message: "Anda harus memesan salah satu!",
      );
    } else {
      if (isCheckout.value) {
        Get.dialog(
          DoubleButtonDialog(
            subTitle: "Apakah Anda yakin infin membatalkan pesanan ini?",
            onCancelPressed: () {
              closeDialog();
            },
            onOKPressed: () {
              _cancel();
            },
          ),
        );
      } else {
        isCheckout.value = true;
      }
    }
    change(menus, status: RxStatus.success());
    log(order.toJson().toString());
  }

  void onVoucherTapped() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(ConstDouble.DEFAULT_PADDING_LAYOUT),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    ConstDouble.DEFAULT_BORDER_RADIUES * 2,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 1),
                    spreadRadius: 2,
                    blurRadius: 8,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/voucher.svg",
                      ),
                      const MyDivider.width(),
                      Text(
                        "Punya kode voucher?",
                        style: CustomFonts.montserratBold24,
                      ),
                    ],
                  ),
                  Text(
                    "Masukan kode voucher disini",
                    style: CustomFonts.montserratRegular14,
                  ),
                  const MyDivider.height(),
                  TextField(
                    controller: voucherController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          voucherController.clear();
                        },
                        icon: const Icon(
                          Icons.close_rounded,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                  const MyDivider.height(),
                  SizedBox(
                    width: double.infinity,
                    child: DefaultButton(
                      onPressed: _validasiVoucher,
                      title: "Validasi Voucher",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onRemoveItemTapped(String pesan, MenusModel data, int quantity) {
    _updateData(pesan, data, quantity);
  }

  void onAddItemTapped(String pesan, MenusModel data, int quantity) {
    _updateData(pesan, data, quantity);
  }

  void _updateData(String pesan, MenusModel data, int quantity) {
    if (order.items.where((element) => element.id == data.id).isEmpty) {
      order.items.add(
        ItemModel(id: data.id, harga: data.harga * quantity, catatan: pesan),
      );
    }

    if (order.items.where((element) => element.id == data.id).isNotEmpty) {
      if (quantity != 0) {
        order.items[order.items
            .indexWhere((element) => element.id == data.id)] = ItemModel(
          id: data.id,
          harga: data.harga * quantity,
          catatan: pesan,
        );
      } else {
        order.items.removeAt(
            order.items.indexWhere((element) => element.id == data.id));
      }
    }
    var total = 0;
    for (var element in order.items) {
      total = total + element.harga;
    }

    order.nominalPesanan = total.toString();
    change(menus, status: RxStatus.success());
  }

  void _validasiVoucher() async {
    if (voucherController.text.isNotEmpty) {
      MyLoading.loading();
      await _menusProvider.voucher(kode: voucherController.text).then((value) {
        voucher = value;
        order.nominalDiskon = voucher.nominal.toString();
        closeBottomSheet();
        MyRawSnackBar.rawSanckBar(
          statusCode: RespCode.SUCCESS,
          message: "Voucher berhasil ditambahkan",
        );
      }).onError((error, stackTrace) {
        closeDialog();
        MyRawSnackBar.rawSanckBar(
          statusCode: RespCode.ERROR,
          message: error.toString(),
        );
      });
    } else {
      order.nominalDiskon = "0";
      closeDialog();
    }
    change(menus, status: RxStatus.success());
  }

  void orderMenu() async {
    MyLoading.loading();
    await _menusProvider.order(order: order).then((value) {
      closeDialog();
      Get.offAllNamed(AppPages.CHECKOUT);
      MyRawSnackBar.rawSanckBar(
        statusCode: RespCode.SUCCESS,
        message: value,
      );
    }).onError((error, stackTrace) {
      closeDialog();
      MyRawSnackBar.rawSanckBar(
        statusCode: RespCode.ERROR,
        message: error.toString(),
      );
    });
  }

  void _cancel() async {
    MyLoading.loading();
    await _menusProvider.cancel(id: "000").then((value) {
      closeDialog();
      Get.offAllNamed(AppPages.CHECKOUT);
      MyRawSnackBar.rawSanckBar(
        statusCode: RespCode.SUCCESS,
        message: value,
      );
    }).onError((error, stackTrace) {
      closeDialog();
      MyRawSnackBar.rawSanckBar(
        statusCode: RespCode.ERROR,
        message: error.toString(),
      );
    });
  }
}
