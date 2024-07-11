import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/appbar/appbar.dart';
import 'package:football_app/common/widgets/custom_shapes/Curved_Edges/TCurvedEdgesWidget.dart';
import 'package:football_app/common/widgets/icons/favoirate_icon.dart';
import 'package:football_app/common/widgets/images/roundedImages.dart';
import 'package:football_app/features/pitch/controllers/image_controller.dart';
import 'package:football_app/features/pitch/models/product_model.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/helpers/helper.dart';
import 'package:get/get.dart';

class TPitchDetailsWithImageSlider extends StatelessWidget {
  const TPitchDetailsWithImageSlider({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImageController());
    final images = controller.getAllProductImages(product);
    final bool isDark = THelperFunctions.isDarkMode(context);

    return CurvedEdgesWidget(
      child: Container(
        color: isDark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace * 2),
                  child: Center(child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (context, url, progress) =>
                            CircularProgressIndicator(
                          value: progress.progress,
                          color: TColors.primaryColor,
                        ),
                      ),
                    );
                  })),
                )),
            Positioned(
              bottom: 30,
              right: 0,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Obx(() {
                      final imageSelected =
                          controller.selectedProductImage.value ==
                              images[index];
                      return TRoundedImage(
                        onPressed: () => controller.selectedProductImage.value =
                            images[index],
                        isNetworkImage: true,
                        imgUrl: images[index],
                        width: 80,
                        backgroundColor: isDark ? TColors.dark : TColors.white,
                        border: Border.all(
                            color: imageSelected
                                ? TColors.primaryColor
                                : Colors.transparent),
                        padding: const EdgeInsets.all(TSizes.sm),
                      );
                    });
                  },
                  separatorBuilder: (_, __) {
                    return const SizedBox(
                      width: TSizes.spaceBtwItems,
                    );
                  },
                  itemCount: images.length,
                ),
              ),
            ),
            TAppbar(
              showBackArrow: true,
              actions: [
                TFavoriateIcon(
                  productId: product.id,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
