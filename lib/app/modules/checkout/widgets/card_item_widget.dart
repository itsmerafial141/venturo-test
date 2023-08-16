import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:venturo/core/utils/extensions/int_extension.dart';
import 'package:venturo/core/utils/extensions/widget_extension.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/fonts/fonts.dart';
import '../../../../core/values/const/double_const.dart';
import '../../../data/models/menus_model.dart';
import '../../../widgets/my_divider_widget.dart';
import '../../../widgets/my_skelaton_widget.dart';
import 'item_buttob_widget.dart';

class CardItem extends StatefulWidget {
  const CardItem({
    super.key,
    required this.data,
    required this.onRemove,
    required this.onAdd,
    required this.isCheckout,
  });

  final MenusModel data;
  final Function(String, MenusModel, int) onRemove;
  final Function(String, MenusModel, int) onAdd;
  final bool isCheckout;
  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  var quantity = 0;
  var controller = TextEditingController();

  void onDecreaseTapped() {
    setState(() {
      if (quantity > 0) {
        quantity--;
        widget.onRemove(controller.text, widget.data, quantity);
      }
    });
  }

  void onIncreaseTapped() {
    setState(() {
      quantity++;
      widget.onAdd(controller.text, widget.data, quantity);
    });
  }

  void onBatalTapped() {
    setState(() {
      quantity = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 85,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                ConstDouble.DEFAULT_BORDER_RADIUES,
              ),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, -1),
                  color: Colors.black12,
                  blurRadius: 4,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: widget.data.gambar,
                  width: 75,
                  height: 75,
                  fit: BoxFit.contain,
                  placeholder: (context, url) {
                    return const Skelaton(
                      height: 75,
                      width: 75,
                    ).shimmer();
                  },
                  errorWidget: (context, url, error) {
                    return Container(
                      width: 75,
                      height: 75,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: CustomColor.INPUT_DISABLE_COLOR,
                        borderRadius: BorderRadius.circular(
                          ConstDouble.DEFAULT_BORDER_RADIUES,
                        ),
                      ),
                      child: const Icon(
                        Icons.image_not_supported_outlined,
                        color: Colors.black26,
                      ),
                    );
                  },
                ).borderRadius(all: ConstDouble.DEFAULT_BORDER_RADIUES),
                const MyDivider.width(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          widget.data.nama,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: CustomFonts.montserratMedium16,
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          quantity <= 1
                              ? widget.data.harga.toRupiah
                              : (widget.data.harga * quantity).toRupiah,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: CustomFonts.montserratBold18.copyWith(
                            color: CustomColor.Glacier,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          if (controller.text.isNotEmpty && widget.isCheckout ||
                              !widget.isCheckout)
                            SvgPicture.asset("assets/icons/edit.svg"),
                          const MyDivider.width(size: .5),
                          Expanded(
                            child: widget.isCheckout
                                ? controller.text.isNotEmpty
                                    ? Text(
                                        controller.text,
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: CustomFonts.montserratRegular12,
                                      )
                                    : const SizedBox()
                                : TextField(
                                    controller: controller,
                                    style: CustomFonts.montserratRegular12,
                                    decoration: const InputDecoration(
                                      hintText: "Tambahkan Catatan",
                                      fillColor: Colors.transparent,
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                  ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                if (widget.isCheckout)
                  SizedBox(
                    width: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          height: 50,
                          width: 1,
                        ).backgroundColor(color: Colors.grey),
                        Text(
                          quantity.toString(),
                          style: CustomFonts.montserratSemibold16.copyWith(
                            color: CustomColor.Glacier,
                          ),
                        ),
                      ],
                    ),
                  ),
                if (!widget.isCheckout)
                  Row(
                    children: [
                      ItemButton.outlined(
                        onPressed: onDecreaseTapped,
                        icon: Icons.remove_rounded,
                      ),
                      SizedBox(
                        width: 30,
                        child: Text(
                          quantity.toString(),
                          style: CustomFonts.montserratMedium18,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ItemButton(
                        onPressed: onIncreaseTapped,
                        icon: Icons.add_rounded,
                      ),
                    ],
                  )
              ],
            ),
          ),
          if (widget.isCheckout && quantity == 0)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  ConstDouble.DEFAULT_BORDER_RADIUES,
                ),
                color: Colors.white54,
              ),
            )
        ],
      ),
    );
  }
}
