import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/custom_shapes/Containers/circularContainer.dart';
import 'package:football_app/common/widgets/images/roundedImages.dart';
import 'package:football_app/common/widgets/shimmer/shimmer_effect.dart';
import 'package:football_app/features/pitch/controllers/banner_controller.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/sizes.dart';

class TSlider extends StatelessWidget {
  const TSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final BannerController controller = Get.put(BannerController());

    return Obx(() {
      if (controller.isLoading.value) {
        return const TShimmerEffect(width: double.infinity, height: 190);
      }
      if (controller.banners.isEmpty) {
        return const Center(
          child: Text("No Data Found"),
        );
      } else {
        return Column(
          children: [
            CarouselSlider(
                items: controller.banners
                    .map((banner) => TRoundedImage(
                          onPressed: () {
                            Get.toNamed(banner.targetScreen);
                          },
                          imgUrl: banner.imageUrl,
                          isNetworkImage: true,
                        ))
                    .toList(),
                options: CarouselOptions(
                    viewportFraction: 1,
                    onPageChanged: (index, _) =>
                        controller.updatePageIndicator(index))),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Center(
              child: Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
                      TCircularContainer(
                          margin: const EdgeInsets.only(right: 10),
                          width: 20,
                          height: 4,
                          backgroundColor:
                              controller.carouselCurrentIndex.value == i
                                  ? TColors.primaryColor
                                  : TColors.grey),
                  ],
                ),
              ),
            )
          ],
        );
      }
    });
  }
}
