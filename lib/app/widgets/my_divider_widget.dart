import 'package:flutter/cupertino.dart';

import '../../core/values/const/double_const.dart';

class MyDivider extends StatelessWidget {
  const MyDivider.height({
    Key? key,
    this.isHight = true,
    this.isWidht = false,
    this.size,
  }) : super(key: key);
  const MyDivider.width({
    Key? key,
    this.isHight = false,
    this.isWidht = true,
    this.size,
  }) : super(key: key);

  final bool? isHight;
  final bool? isWidht;
  final double? size;

  @override
  Widget build(BuildContext context) {
    double tempSize = size ?? 1.0;
    return isHight == true
        ? SizedBox(height: ConstDouble.DEFAULT_DIVIDER * tempSize)
        : SizedBox(width: ConstDouble.DEFAULT_DIVIDER * tempSize);
  }
}
