import 'package:flutter/material.dart';

import '../../../../core/colors/colors.dart';

class ItemButton extends StatelessWidget {
  const ItemButton({
    super.key,
    required this.onPressed,
    this.isDark = true,
    required this.icon,
  });
  const ItemButton.outlined({
    super.key,
    required this.onPressed,
    this.isDark = false,
    required this.icon,
  });

  final Function() onPressed;
  final IconData icon;
  final bool? isDark;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: const BorderSide(
          width: 2,
          color: CustomColor.Glacier,
        ),
      ),
      elevation: 0,
      highlightElevation: 0,
      color: isDark! ? CustomColor.Glacier : Colors.white,
      padding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      minWidth: 20,
      height: 20,
      child: Icon(
        icon,
        color: isDark! ? Colors.white : CustomColor.Glacier,
      ),
    );
  }
}
