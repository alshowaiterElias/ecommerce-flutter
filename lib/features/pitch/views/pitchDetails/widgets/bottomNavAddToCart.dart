import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/icons/TCircularIcon.dart';
import 'package:football_app/features/pitch/controllers/cart_controller.dart';
import 'package:football_app/features/pitch/models/product_model.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/helpers/helper.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TBottomAddtoCart extends StatelessWidget {
  const TBottomAddtoCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final bool isDark = THelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: isDark ? TColors.darkerGrey : TColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRaduisLg),
          topRight: Radius.circular(TSizes.cardRaduisLg),
        ),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                TCircularIcon(
                    onPressed: () => controller.productQuantityInCart.value < 1
                        ? null
                        : controller.productQuantityInCart.value--,
                    icon: Iconsax.minus,
                    width: 40,
                    height: 40,
                    backgroundColor: TColors.darkGrey,
                    color: TColors.white),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text(controller.productQuantityInCart.value.toString(),
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: TSizes.spaceBtwItems),
                TCircularIcon(
                    onPressed: () => controller.productQuantityInCart.value++,
                    icon: Iconsax.add,
                    width: 40,
                    height: 40,
                    backgroundColor: TColors.balck,
                    color: TColors.white),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                controller.productQuantityInCart < 1
                    ? null
                    : controller.addToCart(product);
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(TSizes.md),
                  backgroundColor: TColors.balck,
                  side: const BorderSide(color: TColors.balck)),
              child: const Text("Add to Cart"),
            )
          ],
        ),
      ),
    );
  }
}
