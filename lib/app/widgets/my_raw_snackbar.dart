import 'package:venturo/core/colors/color_swatch.dart';
import 'package:venturo/core/colors/colors.dart';
import 'package:venturo/core/values/keys/response_code_key.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/fonts/fonts.dart';

class MyRawSnackBar {
  static SnackbarController rawSanckBar({
    required int statusCode,
    required String message,
  }) {
    return Get.rawSnackbar(
      messageText: Text(
        message,
        style: CustomFonts.montserratMedium12.copyWith(color: Colors.white),
      ),
      borderRadius: 8,
      borderWidth: 1,
      snackPosition: SnackPosition.TOP,
      backgroundColor: statusCode == RespCode.SUCCESS
          ? CustomSwatch.SUCCESS
          : statusCode == RespCode.ERROR
              ? CustomSwatch.DANGER
              : CustomColor.WHITE,
      margin: const EdgeInsets.all(4),
    );
  }
}
