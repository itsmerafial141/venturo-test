import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../my_app.dart';

double percentageOfSize(
  BuildContext context,
  double size,
  double percentage,
) {
  return size * percentage / 100;
}

double percentageOfScreenHeight(
  BuildContext context,
  double percentage,
) {
  return percentageOfSize(
    context,
    MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top,
    percentage,
  );
}

double percentageOfScreenWidth(
  BuildContext context,
  double percentage,
) {
  return percentageOfSize(
    context,
    MediaQuery.of(context).size.width,
    percentage,
  );
}

Future<String> getJson({required String fileName}) {
  return rootBundle.loadString(fileName);
}

String get randomImage {
  return "https://picsum.photos/id/${Random().nextInt(237)}/200/300";
}

void closeDialog() {
  Get.closeAllSnackbars();
  if (Get.isDialogOpen!) {
    Get.back();
  }
}

void closeBottomSheet() {
  if (Get.isBottomSheetOpen!) {
    if (Get.isDialogOpen!) {
      Get.back();
    }
    Get.back();
  }
}

void getBack() {
  Get.closeAllSnackbars();
  if (Get.isDialogOpen!) {
    Get.back();
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }
  Get.back();
}

SystemUiOverlayStyle statusNavStyle() {
  return const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.white,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarDividerColor: Colors.white,
  );
}

SystemUiOverlayStyle get systemUiOverlayStyle => SystemUiOverlayStyle(
      statusBarColor:
          themeManager.isThemeModeDark ? Colors.black : Colors.white,
      systemNavigationBarColor:
          themeManager.isThemeModeDark ? Colors.black : Colors.white,
      statusBarIconBrightness:
          themeManager.isThemeModeDark ? Brightness.light : Brightness.dark,
    );

Size textSize(String text, TextStyle style) {
  final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr)
    ..layout(minWidth: 0, maxWidth: double.infinity);
  return textPainter.size;
}

Future<void> cameraPermission() async {
  var permission = await Permission.camera.request();
  if (permission.isGranted) {
    // We didn't ask for permission yet or the permission has been denied before but not permanently.
    return;
  } else {
    return Future.error("Maaf, kami tidak dapat mengakses kamera Anda");
  }
}

Future<void> microphonePermission() async {
  var permission = await Permission.microphone.request();
  if (permission.isGranted) {
    // We didn't ask for permission yet or the permission has been denied before but not permanently.
    return;
  } else {
    return Future.error("Maaf, kami tidak dapat mengakses microphone Anda");
  }
}
