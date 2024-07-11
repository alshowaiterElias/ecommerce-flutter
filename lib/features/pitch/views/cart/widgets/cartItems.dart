import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/cart/addRemoveCounter.dart';
import 'package:football_app/common/widgets/cart/cartItem.dart';
import 'package:football_app/common/widgets/texts/priceText.dart';
import 'package:football_app/features/pitch/controllers/cart_controller.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:get/get.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, this.showAddReomveBtn = true});

  final bool showAddReomveBtn;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Obx(
      () => ListView.separated(
          itemCount: controller.cartItems.length,
          shrinkWrap: true,
          separatorBuilder: (_, __) => const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
          itemBuilder: (_, index) {
            return Obx(() {
              final item = controller.cartItems[index];
              return Column(
                children: [
                  TCartItem(cartItem: item),
                  if (showAddReomveBtn)
                    const SizedBox(height: TSizes.spaceBtwItems),
                  if (showAddReomveBtn)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 70),
                            TAddRemoveCounter(
                              quantity: item.quantity,
                              add: () => controller.addOneToCart(item),
                              remove: () => controller.removeOneFromCart(item),
                            ),
                          ],
                        ),
                        TPriceText(
                          price:
                              (item.quantity * item.price).toStringAsFixed(1),
                          currencySign: " Real",
                        )
                      ],
                    ),
                ],
              );
            });
          }),
    );
  }
}
