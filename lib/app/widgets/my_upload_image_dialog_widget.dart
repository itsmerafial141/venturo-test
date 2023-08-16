import 'package:venturo/core/utils/extensions/num_extension.dart';
import 'package:venturo/core/utils/extensions/widget_extension.dart';
import 'package:flutter/material.dart';

import '../../core/colors/color_swatch.dart';
import '../../core/fonts/fonts.dart';
import '../../core/values/const/double_const.dart';
import 'my_divider_widget.dart';

class MyUploadImageDialog extends StatelessWidget {
  const MyUploadImageDialog({
    Key? key,
    required this.onGalleryTapped,
    required this.onCameraTapped,
  }) : super(key: key);

  final Function() onGalleryTapped;
  final Function() onCameraTapped;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Wrap(
        children: [
          Material(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: onCameraTapped,
                    borderRadius: BorderRadius.circular(
                      ConstDouble.DEFAULT_BORDER_RADIUES,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: 20.sh(context),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(
                          ConstDouble.DEFAULT_BORDER_RADIUES,
                        ),
                        border: Border.all(
                          width: 1,
                          color: CustomSwatch.TEXT,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.camera_alt_outlined,
                            color: CustomSwatch.TEXT,
                          ),
                          const MyDivider.height(),
                          Text(
                            "Kamera",
                            style: CustomFonts.montserratSemibold12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const MyDivider.width(),
                Expanded(
                  child: InkWell(
                    onTap: onGalleryTapped,
                    borderRadius: BorderRadius.circular(
                      ConstDouble.DEFAULT_BORDER_RADIUES,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: 20.sh(context),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(
                          ConstDouble.DEFAULT_BORDER_RADIUES,
                        ),
                        border: Border.all(
                          width: 1,
                          color: CustomSwatch.TEXT,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.image_outlined,
                            color: CustomSwatch.TEXT,
                          ),
                          const MyDivider.height(),
                          Text(
                            "Galeri",
                            style: CustomFonts.montserratSemibold12,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ).margin(all: ConstDouble.DEFAULT_PADDING_LAYOUT / 2),
          )
              .backgroundColor(color: Colors.white)
              .borderRadius(all: ConstDouble.DEFAULT_BORDER_RADIUES)
              .margin(horizontal: ConstDouble.DEFAULT_PADDING_LAYOUT),
        ],
      ),
    );
  }
}
