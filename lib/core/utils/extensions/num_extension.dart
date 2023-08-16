// ignore_for_file: unnecessary_this

import 'package:flutter/cupertino.dart';

import '../helpers.dart';

extension DoubleExtension on num {
  // ? sw stand for [Size Width] of screen size.
  double sw(BuildContext context) {
    return percentageOfScreenWidth(
      context,
      this.toDouble(),
    );
  }

  // ? sh stand for [Size Hight] of screen size.
  double sh(BuildContext context) {
    return percentageOfScreenHeight(
      context,
      this.toDouble(),
    );
  }
}
