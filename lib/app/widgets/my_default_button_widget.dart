import 'package:venturo/core/colors/color_swatch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/colors/colors.dart';
import '../../core/fonts/fonts.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.isDark = true,
    this.isOutlined = false,
    this.prefix,
  });
  const DefaultButton.dark({
    super.key,
    required this.onPressed,
    required this.title,
    this.isDark = true,
    this.isOutlined = false,
    this.prefix,
  });
  const DefaultButton.light({
    super.key,
    required this.onPressed,
    required this.title,
    this.isDark = false,
    this.isOutlined = false,
    this.prefix,
  });
  const DefaultButton.outlined({
    super.key,
    required this.onPressed,
    required this.title,
    this.isDark = false,
    this.isOutlined = true,
    this.prefix,
  });

  final Function() onPressed;
  final String title;
  final bool isDark;
  final bool isOutlined;
  final String? prefix;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: isOutlined
          ? Colors.white
          : isDark
              ? CustomColor.Glacier
              : CustomColor.Glacier.withOpacity(.5),
      elevation: 0,
      highlightElevation: 0,
      height: prefix != null ? 45 : 40,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: isOutlined
            ? BorderSide(
                width: 1,
                color: CustomSwatch.DISABLE.shade200,
              )
            : BorderSide.none,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (prefix != null)
            Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset(
                prefix!,
                height: 32,
                width: 32,
              ),
            ),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.visible,
            style: CustomFonts.montserratMedium14.copyWith(
              color: isOutlined
                  ? CustomSwatch.TEXT
                  : isDark
                      ? Colors.white
                      : CustomColor.Glacier,
            ),
          ),
        ],
      ),
    );
  }
}
