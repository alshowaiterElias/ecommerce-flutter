import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/icons/TCircularIcon.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/helpers/helper.dart';
import 'package:iconsax/iconsax.dart';

class TAddRemoveCounter extends StatelessWidget {
  const TAddRemoveCounter({
    super.key,
    required this.quantity,
    this.add,
    this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: THelperFunctions.isDarkMode(context)
              ? TColors.white
              : TColors.balck,
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
          onPressed: remove,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text(quantity.toString(),
            style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: TSizes.spaceBtwItems),
        TCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: TColors.white,
          backgroundColor: TColors.primaryColor,
          onPressed: add,
        ),
      ],
    );
  }
}
