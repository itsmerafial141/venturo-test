import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:venturo/app/widgets/my_default_button_widget.dart';
import 'package:venturo/app/widgets/my_divider_widget.dart';
import 'package:venturo/core/colors/color_swatch.dart';
import 'package:venturo/core/colors/colors.dart';
import 'package:venturo/core/fonts/fonts.dart';
import 'package:venturo/core/utils/extensions/int_extension.dart';
import 'package:venturo/core/utils/extensions/num_extension.dart';
import 'package:venturo/core/utils/extensions/string_extension.dart';
import 'package:venturo/core/values/const/double_const.dart';

import '../controllers/checkout_controller.dart';
import '../widgets/card_item_widget.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarDividerColor: Colors.white,
        ),
        title: const Text("Pesanan"),
        centerTitle: true,
        actions: [
          Obx(
            () => controller.isCheckout.value
                ? IconButton(
                    onPressed: controller.orderMenu,
                    icon: const Icon(
                      Icons.done,
                      color: CustomColor.Glacier,
                    ),
                  )
                : const SizedBox(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: 100.sh(context) - 200,
          width: 100.sw(context),
          child: controller.obx(
            (data) => ListView.separated(
              padding: const EdgeInsets.all(ConstDouble.DEFAULT_PADDING_LAYOUT),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Obx(
                  () => CardItem(
                    data: data[index],
                    isCheckout: controller.isCheckout.value,
                    onRemove: controller.onRemoveItemTapped,
                    onAdd: controller.onAddItemTapped,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const MyDivider.height();
              },
              itemCount: data!.length,
            ),
          ),
        ),
      ),
      bottomNavigationBar: controller.obx(
        (_) => SizedBox(
          height: 200,
          width: 100.sw(context),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                padding: const EdgeInsets.all(
                  ConstDouble.DEFAULT_PADDING_LAYOUT,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(
                      ConstDouble.DEFAULT_BORDER_RADIUES,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            "Total Pesanan ${controller.order.items.isNotEmpty ? "(${controller.order.items.length} Menu)" : ""} :",
                            style: CustomFonts.montserratMedium12,
                          ),
                        ),
                        const MyDivider.width(),
                        Text(
                          controller.order.nominalPesanan.toInt.toRupiah,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: CustomFonts.montserratBold18.copyWith(
                            color: CustomColor.Glacier,
                          ),
                        ),
                      ],
                    ),
                    const MyDivider.height(),
                    const Divider(
                      thickness: 1,
                      height: 1,
                      color: CustomColor.INPUT_DISABLE_COLOR,
                    ),
                    const MyDivider.height(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/voucher.svg",
                        ),
                        const MyDivider.width(),
                        Expanded(
                          child: Text(
                            "Voucher",
                            style: CustomFonts.montserratMedium12,
                          ),
                        ),
                        const MyDivider.width(),
                        if (controller.order.nominalDiskon == "0")
                          controller.obx(
                            (_) => Row(
                              children: [
                                InkWell(
                                  onTap: controller.onVoucherTapped,
                                  child: Text(
                                    "Input Voucher",
                                    style: CustomFonts.montserratRegular12
                                        .copyWith(
                                      color: CustomColor.INPUT_DISABLE_COLOR,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: CustomColor.INPUT_DISABLE_COLOR,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                        if (controller.order.nominalDiskon != "0")
                          controller.obx(
                            (_) => InkWell(
                              onTap: controller.onVoucherTapped,
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        controller.voucher.kode,
                                        style: CustomFonts.montserratRegular12,
                                      ),
                                      Text(
                                        controller.voucher.nominal.toRupiah,
                                        style: CustomFonts.montserratRegular12
                                            .copyWith(
                                          color: CustomSwatch.DANGER,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const MyDivider.width(size: .5),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: CustomColor.INPUT_DISABLE_COLOR,
                                    size: 15,
                                  ),
                                ],
                              ),
                            ),
                          )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 90,
                width: double.infinity,
                padding:
                    const EdgeInsets.all(ConstDouble.DEFAULT_PADDING_LAYOUT),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(
                      ConstDouble.DEFAULT_BORDER_RADIUES * 2,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 1),
                      spreadRadius: 2,
                      blurRadius: 8,
                      color: Colors.black12,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/cart.svg",
                    ),
                    const MyDivider.width(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total Pembayaran",
                            style: CustomFonts.montserratRegular12,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              controller.order.nominalDiskon == "0"
                                  ? controller
                                      .order.nominalPesanan.toInt.toRupiah
                                  : (controller.order.nominalPesanan.toInt -
                                              controller
                                                  .order.nominalDiskon.toInt)
                                          .isNegative
                                      ? 0.toRupiah
                                      : (controller.order.nominalPesanan.toInt -
                                              controller
                                                  .order.nominalDiskon.toInt)
                                          .toRupiah,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: CustomFonts.montserratSemibold20.copyWith(
                                color: CustomColor.Glacier,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const MyDivider.width(),
                    DefaultButton(
                      onPressed: controller.onPesanTapped,
                      title: controller.isCheckout.value
                          ? "Batalkan"
                          : "Pesan Sekarang",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
