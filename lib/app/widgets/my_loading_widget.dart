import 'package:venturo/core/colors/colors.dart';
import 'package:venturo/core/utils/extensions/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/fonts/fonts.dart';
import '../../core/values/const/double_const.dart';
import 'my_divider_widget.dart';

class MyLoading {
  static void loading() {
    Get.dialog(
      Align(
        alignment: Alignment.center,
        child: Wrap(
          children: [
            Material(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(
                      color: CustomColor.Glacier,
                    ),
                    const MyDivider.height(),
                    Text(
                      "Tunggu sebentar...",
                      style: CustomFonts.montserratBold12,
                    ),
                  ],
                ),
              ),
            )
                .backgroundColor(color: Colors.white)
                .borderRadius(all: ConstDouble.DEFAULT_BORDER_RADIUES),
          ],
        ),
      ),
      barrierColor: Colors.black12,
      barrierDismissible: false,
    );
  }
}
