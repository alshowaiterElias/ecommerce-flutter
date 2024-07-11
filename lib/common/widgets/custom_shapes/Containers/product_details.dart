import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/custom_shapes/Containers/circularContainer.dart';
import 'package:football_app/common/widgets/images/circularImages.dart';
import 'package:football_app/common/widgets/texts/TpitchTitleWithIcon.dart';
import 'package:football_app/features/pitch/models/brand_model.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:football_app/utils/constants/enums.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/helpers/helper.dart';

class TProductDetails extends StatelessWidget {
  const TProductDetails({
    super.key,
    this.onTap,
    this.showBorder = true,
    required this.brand,
  });

  final BrandModel brand;
  final void Function()? onTap;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TCircularContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        backgroundColor: Colors.transparent,
        showBorder: showBorder,
        child: Row(
          children: [
            Flexible(
              child: TCircularImage(
                isNetworkImage: true,
                image: brand.image,
                backgroundColor: Colors.transparent,
                overlayColor: THelperFunctions.isDarkMode(context)
                    ? TColors.white
                    : TColors.balck,
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TPitchTypeWithIcon(
                    title: brand.name,
                    textSizes: TextSizes.large,
                  ),
                  Text(
                    "${brand.productsCount ?? 0} products",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
