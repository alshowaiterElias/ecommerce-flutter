import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/custom_shapes/Containers/circularContainer.dart';
import 'package:football_app/common/widgets/custom_shapes/Containers/product_details.dart';
import 'package:football_app/common/widgets/shimmer/shimmer_effect.dart';
import 'package:football_app/features/pitch/models/brand_model.dart';
import 'package:football_app/features/pitch/views/brand/brandProduts.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/helpers/helper.dart';
import 'package:get/get.dart';

class TPitchShowCase extends StatelessWidget {
  const TPitchShowCase({super.key, required this.images, required this.brand});
  final BrandModel brand;
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: TCircularContainer(
        padding: const EdgeInsets.all(TSizes.md),
        showBorder: true,
        borderColor: TColors.darkGrey,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        child: Column(
          children: [
            TProductDetails(
              brand: brand,
              showBorder: false,
            ),
            Row(
              children:
                  images.map((img) => pitchImageDetails(img, context)).toList(),
            )
          ],
        ),
      ),
    );
  }
}

Widget pitchImageDetails(String image, context) {
  return Expanded(
      child: TCircularContainer(
          height: 100,
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkGrey
              : TColors.white,
          margin: const EdgeInsets.only(right: TSizes.sm),
          padding: const EdgeInsets.all(TSizes.sm),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.contain,
            progressIndicatorBuilder: (context, url, progress) =>
                const TShimmerEffect(width: 100, height: 100),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )));
}
