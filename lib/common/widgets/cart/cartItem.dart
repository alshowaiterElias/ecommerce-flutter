import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/images/roundedImages.dart';
import 'package:football_app/common/widgets/texts/TpitchTitle.dart';
import 'package:football_app/common/widgets/texts/TpitchTitleWithIcon.dart';
import 'package:football_app/features/pitch/models/cart_item.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/helpers/helper.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({super.key, required this.cartItem});

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TRoundedImage(
          isNetworkImage: true,
          imgUrl: cartItem.image ?? "",
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TPitchTypeWithIcon(title: cartItem.brandName ?? ""),
              TPitchTitleText(title: cartItem.title, maxLines: 1),
              Text.rich(TextSpan(
                  children: (cartItem.selectedVariation ?? {})
                      .entries
                      .map((e) => TextSpan(children: [
                            TextSpan(
                                text: ' ${e.key} ',
                                style: Theme.of(context).textTheme.bodySmall),
                            TextSpan(
                                text: ' ${e.value} ',
                                style: Theme.of(context).textTheme.bodyLarge)
                          ]))
                      .toList()))
            ],
          ),
        )
      ],
    );
  }
}
