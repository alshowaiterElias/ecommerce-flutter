import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/shimmer/shimmer_effect.dart';
import 'package:football_app/utils/constants/sizes.dart';

class THorizantalShimmerEffect extends StatelessWidget {
  const THorizantalShimmerEffect({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TShimmerEffect(width: 120, height: 120),
                SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Column(
                  children: [
                    SizedBox(height: TSizes.spaceBtwItems / 2),
                    TShimmerEffect(width: 160, height: 15),
                    SizedBox(height: TSizes.spaceBtwItems / 2),
                    TShimmerEffect(width: 110, height: 15),
                    SizedBox(height: TSizes.spaceBtwItems / 2),
                    TShimmerEffect(width: 80, height: 15),
                    Spacer()
                  ],
                )
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
          itemCount: itemCount),
    );
  }
}
