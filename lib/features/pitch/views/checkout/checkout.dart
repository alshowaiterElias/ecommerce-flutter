import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/appbar/appbar.dart';
import 'package:football_app/common/widgets/custom_shapes/Containers/circularContainer.dart';
import 'package:football_app/common/widgets/pitches/promo.dart';
import 'package:football_app/features/pitch/controllers/cart_controller.dart';
import 'package:football_app/features/pitch/controllers/order_controller.dart';
import 'package:football_app/features/pitch/views/cart/widgets/cartItems.dart';
import 'package:football_app/features/pitch/views/checkout/widgets/billingAddressSection.dart';
import 'package:football_app/features/pitch/views/checkout/widgets/billingAmountSection.dart';
import 'package:football_app/features/pitch/views/checkout/widgets/billingPaymentSection.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/helpers/helper.dart';
import 'package:football_app/utils/loaders/loaders.dart';
import 'package:get/get.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    final orderController = Get.put(OrderController());
    final bool isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppbar(
        title: Text(
          "Checkout",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Items in cart
              const CartItems(showAddReomveBtn: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              //Coupon
              const TPromoCode(),
              const SizedBox(height: TSizes.spaceBtwSections),

              //billing Section
              TCircularContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                backgroundColor: isDark ? TColors.balck : TColors.white,
                child: const Column(
                  children: [
                    //pricing
                    BillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    //divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //payment method
                    BillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //address
                    BillingAddressSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: cartController.totalCartPrice.value > 0
                ? () => orderController
                    .processOrder(cartController.findTotalPrice())
                : () => TLoaders.warningSnackBar(
                    title: "Empty Cart",
                    message: "Add items in the cart in order to proceed"),
            child: Text("Checkout ${cartController.findTotalPrice()} Real")),
      ),
    );
  }
}
