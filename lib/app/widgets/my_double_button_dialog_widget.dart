import 'package:venturo/app/widgets/my_divider_widget.dart';
import 'package:venturo/core/colors/colors.dart';
import 'package:venturo/core/utils/extensions/num_extension.dart';
import 'package:venturo/core/utils/extensions/widget_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/fonts/fonts.dart';
import '../../core/values/const/double_const.dart';

class DoubleButtonDialog extends StatelessWidget {
  const DoubleButtonDialog({
    Key? key,
    this.title,
    required this.subTitle,
    required this.onCancelPressed,
    required this.onOKPressed,
    this.cancelColor,
    this.okColor,
    this.firstButtonText,
    this.secondButtonText,
  }) : super(key: key);

  final String? title;
  final String subTitle;
  final String? firstButtonText;
  final String? secondButtonText;
  final Color? cancelColor;
  final Color? okColor;

  final Function() onCancelPressed;
  final Function() onOKPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Wrap(
        children: [
          Material(
            child: Container(
              padding: const EdgeInsets.all(ConstDouble.DEFAULT_PADDING_LAYOUT),
              width: 80.sw(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  ConstDouble.DEFAULT_BORDER_RADIUES * 2,
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.warning_amber,
                        color: CustomColor.Glacier,
                        size: 40,
                      ),
                      const MyDivider.width(),
                      Expanded(
                        child: Text(
                          subTitle,
                          style: CustomFonts.montserratRegular12,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const SizedBox(
                        height: ConstDouble.DEFAULT_PADDING_LAYOUT,
                      ),
                    ],
                  ),
                  const MyDivider.height(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onCancelPressed,
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                              const Size(double.infinity, 40),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              cancelColor ?? Colors.white,
                            ),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(999),
                                  side: const BorderSide(
                                    width: 2,
                                    color: CustomColor.Glacier,
                                  )),
                            ),
                          ),
                          child: Text(
                            firstButtonText ?? "Batal",
                            style: CustomFonts.montserratBold12.copyWith(
                              color: CustomColor.Glacier,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: ConstDouble.DEFAULT_PADDING_LAYOUT,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onOKPressed,
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                              const Size(double.infinity, 40),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              okColor ?? CustomColor.Glacier,
                            ),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(999),
                              ),
                            ),
                          ),
                          child: Text(
                            secondButtonText ?? "Yakin",
                            style: CustomFonts.montserratBold12.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )
          .borderRadius(all: ConstDouble.DEFAULT_BORDER_RADIUES * 2)
          .margin(all: ConstDouble.DEFAULT_PADDING_LAYOUT),
    );
  }
}
