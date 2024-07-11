import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/texts/TpitchTitle.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:football_app/utils/constants/enums.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class TPitchTypeWithIcon extends StatelessWidget {
  const TPitchTypeWithIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = TColors.primaryColor,
    this.textAlign = TextAlign.center,
    this.textSizes = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes textSizes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: TPitchTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            textSizes: textSizes,
          ),
        ),
        const SizedBox(width: TSizes.xs),
        Icon(Iconsax.verify5, color: iconColor, size: TSizes.iconsSm)
      ],
    );
  }
}
