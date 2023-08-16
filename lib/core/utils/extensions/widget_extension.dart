import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../colors/color_swatch.dart';


extension WidgetExtension on Widget {
  Widget backgroundColor({Color? color}) {
    return ColoredBox(
      color: color ?? Colors.transparent,
      child: this,
    );
  }

  Widget borderRadius({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
    double? verticalTop,
    double? verticalBottom,
    double? horizontalLeft,
    double? horizontalRight,
    double? all,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          topLeft ?? verticalTop ?? horizontalLeft ?? all ?? 0,
        ),
        topRight: Radius.circular(
          topRight ?? verticalTop ?? horizontalRight ?? all ?? 0,
        ),
        bottomLeft: Radius.circular(
          bottomLeft ?? verticalBottom ?? horizontalLeft ?? all ?? 0,
        ),
        bottomRight: Radius.circular(
          bottomRight ?? verticalBottom ?? horizontalRight ?? all ?? 0,
        ),
      ),
      child: this,
    );
  }

  Widget margin({
    double? horizontal,
    double? vertical,
    double? top,
    double? right,
    double? bottom,
    double? left,
    double? all,
  }) {
    return Container(
      margin: EdgeInsets.only(
        top: top ?? vertical ?? all ?? 0,
        bottom: bottom ?? vertical ?? all ?? 0,
        left: left ?? horizontal ?? all ?? 0,
        right: right ?? horizontal ?? all ?? 0,
      ),
      child: this,
    );
  }

  Widget shimmer() {
    return Shimmer.fromColors(
      baseColor: CustomSwatch.DISABLE,
      highlightColor: Colors.white,
      child: this,
    );
  }
}
