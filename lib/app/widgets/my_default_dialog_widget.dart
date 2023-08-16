import 'package:venturo/core/values/const/double_const.dart';
import 'package:flutter/material.dart';
import 'package:venturo/core/utils/extensions/num_extension.dart';
import 'package:venturo/core/utils/extensions/widget_extension.dart';

import '../../core/colors/color_swatch.dart';
import '../../core/fonts/fonts.dart';
import 'my_divider_widget.dart';

class MyDefaultDialogWidget extends StatelessWidget {
  const MyDefaultDialogWidget({
    Key? key,
    required this.onPressed,
    required this.asset,
    required this.title,
    required this.description,
    required this.button,
    this.path = 0,
  }) : super(key: key);
  const MyDefaultDialogWidget.success({
    Key? key,
    required this.onPressed,
    this.asset = "assets/images/dialog/dialog_success.png",
    required this.title,
    required this.description,
    required this.button,
    this.path = 1,
  }) : super(key: key);
  const MyDefaultDialogWidget.info({
    Key? key,
    required this.onPressed,
    this.asset = "assets/images/dialog/dialog_info.png",
    required this.title,
    required this.description,
    required this.button,
    this.path = 2,
  }) : super(key: key);
  const MyDefaultDialogWidget.warning({
    Key? key,
    required this.onPressed,
    this.asset = "assets/images/dialog/dialog_warning.png",
    required this.title,
    required this.description,
    required this.button,
    this.path = 3,
  }) : super(key: key);
  const MyDefaultDialogWidget.question({
    Key? key,
    required this.onPressed,
    this.asset = "assets/images/dialog/dialog_question.png",
    required this.title,
    required this.description,
    required this.button,
    this.path = 4,
  }) : super(key: key);
  const MyDefaultDialogWidget.error({
    Key? key,
    required this.onPressed,
    this.asset = "assets/images/dialog/dialog_error.png",
    required this.title,
    required this.description,
    required this.button,
    this.path = 5,
  }) : super(key: key);

  final Function() onPressed;
  final String asset;
  final String title;
  final String description;
  final String button;
  final int path;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Wrap(
        children: [
          Material(
            child: Container(
              padding: const EdgeInsets.all(ConstDouble.DEFAULT_PADDING_LAYOUT),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  ConstDouble.DEFAULT_BORDER_RADIUES,
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Image.asset(
                    asset,
                  ),
                  const MyDivider.height(),
                  SizedBox(
                    width: 70.sw(context),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: CustomFonts.montserratSemibold24.copyWith(
                        color: path == 1
                            ? CustomSwatch.SUCCESS
                            : path == 2
                                ? CustomSwatch.INFO
                                : path == 3
                                    ? CustomSwatch.WARNING
                                    : path == 4
                                        ? CustomSwatch.INFO
                                        : path == 5
                                            ? CustomSwatch.DANGER
                                            : CustomSwatch.PRIMARY,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 70.sw(context),
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
                      style: CustomFonts.montserratRegular12,
                    ),
                  ),
                  const MyDivider.height(),
                  ElevatedButton(
                    onPressed: onPressed,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        path == 1
                            ? CustomSwatch.SUCCESS
                            : path == 2
                                ? CustomSwatch.INFO
                                : path == 3
                                    ? CustomSwatch.WARNING
                                    : path == 4
                                        ? CustomSwatch.INFO
                                        : path == 5
                                            ? CustomSwatch.DANGER
                                            : CustomSwatch.PRIMARY,
                      ),
                    ),
                    child: Text(button),
                  ),
                ],
              ),
            ),
          )
        ],
      )
          .borderRadius(all: ConstDouble.DEFAULT_BORDER_RADIUES)
          .margin(all: ConstDouble.DEFAULT_PADDING_LAYOUT),
    );
  }
}
