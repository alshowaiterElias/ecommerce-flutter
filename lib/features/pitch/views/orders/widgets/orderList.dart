import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/custom_shapes/Containers/circularContainer.dart';
import 'package:football_app/features/pitch/controllers/order_controller.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/helpers/cloud_helper_function.dart';
import 'package:football_app/utils/helpers/helper.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    print("hi");
    final controller = Get.put(OrderController());
    print("hiii");

    final bool isDark = THelperFunctions.isDarkMode(context);
    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (context, snapshot) {
          final respone =
              TCloudHelperFunction.checkMultiRecordState(snapshot: snapshot);
          if (respone != null) {
            return respone;
          }
          final orders = snapshot.data!;
          return ListView.separated(
              itemBuilder: (_, index) {
                return TCircularContainer(
                  showBorder: true,
                  backgroundColor: isDark ? TColors.dark : TColors.light,
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //Row 1
                      Row(
                        children: [
                          const Icon(Iconsax.ship),
                          const SizedBox(width: TSizes.spaceBtwItems),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(orders[index].orderStatusText,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .apply(
                                            color: TColors.primaryColor,
                                            fontWeightDelta: 1)),
                                Text(orders[index].orderDate.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Iconsax.arrow_right_34,
                                size: TSizes.iconsSm,
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const Icon(Iconsax.tag),
                                const SizedBox(width: TSizes.spaceBtwItems),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Order",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium),
                                      Text(orders[index].id,
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                const Icon(Iconsax.calendar),
                                const SizedBox(width: TSizes.spaceBtwItems),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Shipping Date",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium),
                                      Text(
                                          orders[index].deliveryDate.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
              itemCount: orders.length);
        });
  }
}
