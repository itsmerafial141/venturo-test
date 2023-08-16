import 'package:venturo/core/values/const/double_const.dart';
import 'package:flutter/material.dart';
import 'package:venturo/core/utils/extensions/num_extension.dart';

import '../../core/colors/color_swatch.dart';

class Skelaton extends StatelessWidget {
  const Skelaton({
    Key? key,
    this.height,
    this.width,
    this.borderRadius,
  }) : super(key: key);
  final double? height;
  final double? width;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 1.sw(context),
      width: width ?? 1.sw(context),
      decoration: BoxDecoration(
        color: CustomSwatch.DISABLE.shade400,
        borderRadius: BorderRadius.circular(
          borderRadius ?? ConstDouble.DEFAULT_BORDER_RADIUES,
        ),
      ),
    );
  }
}
