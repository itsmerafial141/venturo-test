// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';

class CustomDecoration {
  CustomDecoration(this.context);
  final BuildContext context;

  // double get defaultPadding => 2.sw(context);
  // double get dHorizontalPadding => 4.sw(context);
  double get viewPaddingTop => MediaQuery.of(context).viewPadding.top;
  // double get defaultDividerHeight => 2.sh(context);
  // double get defaultDividerWidth => 2.sw(context);
}
