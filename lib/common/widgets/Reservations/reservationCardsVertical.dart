import 'package:flutter/material.dart';
import 'package:football_app/common/styles/TShadowStyle.dart';
import 'package:football_app/common/widgets/custom_shapes/Containers/circularContainer.dart';
import 'package:football_app/common/widgets/icons/favoirate_icon.dart';
import 'package:football_app/common/widgets/images/roundedImages.dart';
import 'package:football_app/common/widgets/texts/TpitchTitleWithIcon.dart';
import 'package:football_app/common/widgets/texts/priceText.dart';
import 'package:football_app/common/widgets/texts/reservationTitle.dart';
import 'package:football_app/features/pitch/controllers/cart_controller.dart';
import 'package:football_app/features/pitch/controllers/product_controller.dart';
import 'package:football_app/features/pitch/models/product_model.dart';
import 'package:football_app/features/pitch/views/pitchDetails/pitchDetails.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:football_app/utils/constants/enums.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/helpers/helper.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TReservationsVertical extends StatelessWidget {
  const TReservationsVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePrecentage =
        controller.calculateSalePrecentage(product.price, product.salePrice);
    final bool isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        Get.to(() => PitchDetails(
              product: product,
            ));
      },
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            color: isDark ? TColors.darkGrey : TColors.white,
            borderRadius: BorderRadius.circular(TSizes.cardRaduisLg),
            boxShadow: [TShadowStyle.verticalReservationShadow]),
        child: Column(
          children: [
            //Thumbnail
            TCircularContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: isDark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  //Image

                  Center(
                    child: TRoundedImage(
                        imgUrl: product.thumbNail, isNetworkImage: true),
                  ),
                  if (salePrecentage != null)
                    Positioned(
                      top: 12,
                      child: TCircularContainer(
                        raduis: TSizes.sm,
                        backgroundColor:
                            TColors.secondaryColor.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: TSizes.sm, vertical: TSizes.xs),
                        child: Text("$salePrecentage%",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: TColors.balck)),
                      ),
                    ),
                  Positioned(
                    right: 3,
                    top: 3,
                    child: TFavoriateIcon(productId: product.id),
                  )
                ],
              ),
            ), //Details
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Name and Pitch Type
                  TReservationTitle(
                    smallSize: true,
                    title: product.title,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  TPitchTypeWithIcon(title: product.brand!.name),
                ],
              ),
            ),
            const Spacer(),
            //price and Icon Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: TSizes.sm),
                          child: Text(
                            controller.getProductPrice(product),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left: TSizes.sm),
                        child: TPriceText(
                          price: controller.getProductPrice(product),
                        ),
                      ),
                    ],
                  ),
                ),
                //add to cart
                ProductAddToCartIcon(
                  product: product,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProductAddToCartIcon extends StatelessWidget {
  const ProductAddToCartIcon({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return InkWell(
      onTap: () {
        if (product.productType == ProductType.single.toString()) {
          final cartItme = controller.convertToCartItem(product, 1);
          controller.addOneToCart(cartItme);
        } else {
          Get.to(() => PitchDetails(product: product));
        }
      },
      child: Obx(() {
        final prodcutQuantityInCart =
            controller.getProductQuantityInCart(product.id);

        return Container(
          decoration: BoxDecoration(
            color:
                prodcutQuantityInCart > 0 ? TColors.primaryColor : TColors.dark,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(TSizes.cardRaduisMd),
                bottomRight: Radius.circular(TSizes.cardRaduisMd)),
          ),
          child: SizedBox(
            width: TSizes.iconsLg * 1.2,
            height: TSizes.iconsLg * 1.2,
            child: Center(
              child: prodcutQuantityInCart > 0
                  ? Text(
                      prodcutQuantityInCart.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: TColors.white),
                    )
                  : const Icon(Iconsax.add, color: TColors.white),
            ),
          ),
        );
      }),
    );
  }
}
