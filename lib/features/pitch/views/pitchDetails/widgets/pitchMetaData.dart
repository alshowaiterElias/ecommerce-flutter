import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/custom_shapes/Containers/circularContainer.dart';
import 'package:football_app/common/widgets/images/circularImages.dart';
import 'package:football_app/common/widgets/texts/TpitchTitle.dart';
import 'package:football_app/common/widgets/texts/TpitchTitleWithIcon.dart';
import 'package:football_app/common/widgets/texts/priceText.dart';
import 'package:football_app/features/pitch/controllers/product_controller.dart';
import 'package:football_app/features/pitch/models/product_model.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:football_app/utils/constants/enums.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/helpers/helper.dart';

class TPitchMetaData extends StatelessWidget {
  const TPitchMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePrecentage =
        controller.calculateSalePrecentage(product.price, product.salePrice);
    final bool isDark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            //sale
            TCircularContainer(
              raduis: TSizes.sm,
              backgroundColor: TColors.secondaryColor.withOpacity(0.9),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text("$salePrecentage%",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.balck)),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),

            //Price
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text(product.price.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(decoration: TextDecoration.lineThrough)),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              const SizedBox(width: TSizes.spaceBtwItems),

            TPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
              currencySign: " Real",
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        //title
        TPitchTitleText(title: product.title, textSizes: TextSizes.medium),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        //status
        Row(
          children: [
            const TPitchTitleText(title: "Status"),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(controller.getProductStockStatus(product.stock),
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            TCircularImage(
              image: product.brand != null ? product.brand!.image : "",
              width: 32,
              height: 32,
              overlayColor: isDark ? TColors.white : TColors.balck,
            ),
            TPitchTypeWithIcon(
              title: product.brand != null ? product.brand!.name : "",
              textSizes: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
