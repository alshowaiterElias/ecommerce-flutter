import 'package:flutter/material.dart';
import 'package:football_app/features/pitch/controllers/cart_controller.dart';
import 'package:football_app/utils/constants/sizes.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Column(
      children: [
        //subTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal", style: Theme.of(context).textTheme.bodyMedium),
            Text(controller.totalCartPrice.value.toString(),
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        // Tax fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping fee", style: Theme.of(context).textTheme.bodyMedium),
            Text(controller.shippingCost.toString(),
                style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        // Tax fee
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text("Tax fee", style: Theme.of(context).textTheme.bodyMedium),
        //     Text("100", style: Theme.of(context).textTheme.labelLarge),
        //   ],
        // ),

        const SizedBox(height: TSizes.spaceBtwItems / 2),
        // Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order total", style: Theme.of(context).textTheme.bodyMedium),
            Text(
                (controller.totalCartPrice.value + controller.shippingCost)
                    .toString(),
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
