import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/choiceChip/TChoiceChip.dart';
import 'package:football_app/common/widgets/custom_shapes/Containers/circularContainer.dart';
import 'package:football_app/common/widgets/texts/TpitchTitle.dart';
import 'package:football_app/common/widgets/texts/priceText.dart';
import 'package:football_app/common/widgets/texts/sectionHeader.dart';
import 'package:football_app/features/pitch/controllers/variation_controller.dart';
import 'package:football_app/features/pitch/models/product_model.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:football_app/utils/constants/enums.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/helpers/helper.dart';
import 'package:get/get.dart';

class TPitchAttributes extends StatelessWidget {
  const TPitchAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final bool isDark = THelperFunctions.isDarkMode(context);
    return Obx(
      () => Column(
        children: [
          //Variation Box

          if (controller.selectedVariation.value.id.isNotEmpty)
            TCircularContainer(
              backgroundColor: isDark ? TColors.darkerGrey : TColors.grey,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const TSectionHeader(
                            title: "Variation", showActionButton: false),
                        const SizedBox(width: TSizes.spaceBtwItems),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const TPitchTitleText(
                                    title: "Price : ",
                                    textSizes: TextSizes.small),
                                //actual price
                                if (controller
                                        .selectedVariation.value.salePrice >
                                    0)
                                  Text(
                                    controller.selectedVariation.value.price
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .apply(
                                            decoration:
                                                TextDecoration.lineThrough),
                                  ),
                                const SizedBox(width: TSizes.spaceBtwItems),

                                // Sale Price
                                TPriceText(
                                    price: controller.getVariationPrice(),
                                    currencySign: " R"),
                              ],
                            )
                            //Stock
                            ,
                            Row(
                              children: [
                                const TPitchTitleText(
                                    title: "Stock : ",
                                    textSizes: TextSizes.small),
                                Text(
                                  controller.variationStockStatus.value,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    TPitchTitleText(
                      title:
                          controller.selectedVariation.value.description ?? "",
                      maxLines: 4,
                      textSizes: TextSizes.small,
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(height: TSizes.spaceBtwItems),
          //attributes
          Column(
            children: product.productAttributes!
                .map(
                  (attribute) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TSectionHeader(
                          title: attribute.name ?? "", showActionButton: false),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),
                      Obx(
                        () => Wrap(
                          spacing: 8,
                          children: attribute.values!.map((attributeValue) {
                            final isSelected =
                                controller.selectedAttributes[attribute.name] ==
                                    attributeValue;
                            final available = controller
                                .getAttributeAvailabilityInVaraiation(
                                    product.productVariations!, attribute.name!)
                                .contains(attributeValue);
                            return TChoiceChip(
                              text: attributeValue,
                              selected: isSelected,
                              onSelected: available
                                  ? (selected) {
                                      if (selected && available) {
                                        controller.onAttributeSelected(
                                            product,
                                            attribute.name ?? "",
                                            attributeValue);
                                      }
                                    }
                                  : null,
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
