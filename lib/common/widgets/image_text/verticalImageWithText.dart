import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/images/circularImages.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/helpers/helper.dart';

class TVerticalImageWithText extends StatelessWidget {
  const TVerticalImageWithText({
    super.key,
    required this.image,
    required this.text,
    this.backgroundColor,
    this.textColor = TColors.white,
    this.isNetworkImage = false,
    this.onTap,
  });

  final String image, text;
  final Color? backgroundColor;
  final Color textColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            TCircularImage(
              image: image,
              boxFit: BoxFit.fitWidth,
              isNetworkImage: isNetworkImage,
              padding: TSizes.sm * 1.4,
              backgroundColor: backgroundColor,
              overlayColor: isDark ? TColors.light : TColors.dark,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 3,
            ),
            SizedBox(
              width: 55,
              child: Center(
                child: Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
