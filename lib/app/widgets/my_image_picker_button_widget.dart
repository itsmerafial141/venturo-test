import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';
import '../../core/fonts/fonts.dart';
import '../../core/values/const/double_const.dart';
import 'my_divider_widget.dart';

class ImagePickerButton extends StatelessWidget {
  const ImagePickerButton({
    super.key,
    required this.onTap,
    required this.hint,
  });

  final Function() onTap;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      dashPattern: const [6, 3],
      radius: const Radius.circular(12),
      padding: const EdgeInsets.all(6),
      color: CustomColor.PRIMARY,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          ConstDouble.DEFAULT_BORDER_RADIUES,
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(
            ConstDouble.DEFAULT_BORDER_RADIUES,
          ),
          child: SizedBox(
            height: 120,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.add_a_photo_rounded,
                  color: CustomColor.INPUT_DISABLE_COLOR,
                ),
                const MyDivider.height(),
                Text(
                  hint,
                  style: CustomFonts.montserratMedium12.copyWith(
                    color: CustomColor.INPUT_DISABLE_COLOR,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
