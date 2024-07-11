import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/shimmer/shimmer_effect.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/helpers/helper.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.boxFit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = TSizes.sm,
  });

  final BoxFit? boxFit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor, backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: backgroundColor != null
              ? THelperFunctions.isDarkMode(context)
                  ? TColors.balck
                  : TColors.white
              : null,
          borderRadius: BorderRadius.circular(100)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(1000),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: boxFit,
                  color: overlayColor,
                  imageUrl: image,
                  progressIndicatorBuilder: (context, url, progress) =>
                      const TShimmerEffect(width: 55, height: 55),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  image: AssetImage(image) as ImageProvider,
                  color: overlayColor,
                  fit: boxFit,
                ),
        ),
      ),
    );
  }
}
