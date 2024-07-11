import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/appbar/appbar.dart';
import 'package:football_app/common/widgets/loaders/loaderAnimation.dart';
import 'package:football_app/features/pitch/controllers/cart_controller.dart';

import 'package:football_app/features/pitch/views/cart/widgets/cartItems.dart';
import 'package:football_app/features/pitch/views/checkout/checkout.dart';
import 'package:football_app/nav.dart';
import 'package:football_app/utils/constants/image_strings.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: TAppbar(
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Obx(() {
        final emptyWidget = TAnimationLoaderWidget(
          text: "No Itmes",
          animation: TImageStrings.docerAnimation,
          showAction: true,
          actionText: "Fill it",
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );

        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: CartItems(),
            ),
          );
        }
      }),
      bottomNavigationBar: controller.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const CheckOutScreen());
                  },
                  child: Obx(() => Text(
                      "Checkout ${controller.totalCartPrice.value} Real"))),
            ),
    );
  }
}
