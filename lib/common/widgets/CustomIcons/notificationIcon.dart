import 'package:flutter/material.dart';
import 'package:football_app/features/pitch/controllers/cart_controller.dart';
import 'package:football_app/features/pitch/views/cart/cart.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TCartIcon extends StatelessWidget {
  const TCartIcon({
    super.key,
    this.iconColor = TColors.white,
  });

  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    return Stack(children: [
      IconButton(
          onPressed: () {
            Get.to(() => const CartScreen());
          },
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconColor,
          )),
      Positioned(
        right: 0,
        child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18), color: TColors.balck),
          child: Center(
            child: Obx(
              () => Text(
                controller.noOfCartItem.value.toString(),
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .apply(color: TColors.white, fontSizeFactor: 0.8),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
