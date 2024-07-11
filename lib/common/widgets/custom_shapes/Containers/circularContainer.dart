import 'package:flutter/material.dart';
import 'package:football_app/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.width,
    this.height,
    this.raduis = TSizes.cardRaduisLg,
    this.padding,
    this.child,
    this.backgroundColor = TColors.white,
    this.margin,
    this.showBorder = false,
    this.borderColor = TColors.primaryColor,
  });

  final double? width, height;
  final double raduis;
  final bool showBorder;
  final EdgeInsets? margin, padding;
  final Widget? child;
  final Color backgroundColor, borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(raduis),
          color: backgroundColor,
          border: showBorder ? Border.all(color: borderColor) : null),
      child: child,
    );
  }
}
