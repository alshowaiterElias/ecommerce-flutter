import 'package:flutter/material.dart';
import 'package:football_app/utils/constants/sizes.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imgUrl,
    this.applyImageRaduis = true,
    this.border,
    this.backgroundColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRaduis = TSizes.md,
  });

  final double? width, height;
  final String imgUrl;
  final bool applyImageRaduis;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRaduis;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRaduis),
        ),
        child: ClipRRect(
          borderRadius: applyImageRaduis
              ? BorderRadius.circular(borderRaduis)
              : BorderRadius.zero,
          child: Image(
            image: isNetworkImage
                ? NetworkImage(imgUrl)
                : AssetImage(imgUrl) as ImageProvider,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
