import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/texts/sectionHeader.dart';
import 'package:football_app/features/personalization/controllers/address_controller.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:get/get.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.intance;
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TSectionHeader(
            title: "Shipping Address",
            buttonTitle: "Change",
            onPressd: () {
              controller.selectNewAddressPopup(context);
            },
          ),
          controller.selectedAddress.value.id.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.selectedAddress.value.name,
                        style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    Row(
                      children: [
                        const Icon(Icons.phone,
                            color: Colors.grey, size: TSizes.iconsMd),
                        const SizedBox(
                          width: TSizes.spaceBtwItems,
                        ),
                        Text(controller.selectedAddress.value.phoneNumber,
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    Row(
                      children: [
                        const Icon(Icons.location_history,
                            color: Colors.grey, size: TSizes.iconsMd),
                        const SizedBox(
                          width: TSizes.spaceBtwItems,
                        ),
                        Expanded(
                          child: Text(
                            controller.selectedAddress.value.toString(),
                            style: Theme.of(context).textTheme.bodyMedium,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Text(
                  "Select Address",
                  style: Theme.of(context).textTheme.bodyMedium,
                )
        ],
      ),
    );
  }
}
