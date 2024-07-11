import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/texts/sectionHeader.dart';
import 'package:football_app/features/pitch/models/product_model.dart';
import 'package:football_app/features/pitch/views/pitchDetails/widgets/bottomNavAddToCart.dart';

import 'package:football_app/features/pitch/views/pitchDetails/widgets/pitchDetailsWithImageSlider.dart';
import 'package:football_app/features/pitch/views/pitchDetails/widgets/pitchMetaData.dart';
import 'package:football_app/features/pitch/views/pitchDetails/widgets/pitcheAttribute.dart';
import 'package:football_app/features/pitch/views/pitchDetails/widgets/ratingAndShare.dart';
import 'package:football_app/features/pitch/views/pitchReviews/pitchReviews.dart';
import 'package:football_app/utils/constants/enums.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class PitchDetails extends StatelessWidget {
  const PitchDetails({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TBottomAddtoCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPitchDetailsWithImageSlider(product: product),
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace,
                  left: TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //ratings and share
                  const TRatingAndShare(),
                  //price title available type
                  TPitchMetaData(product: product),

                  //attribuites
                  if (product.productType == ProductType.variable.toString())
                    TPitchAttributes(product: product),

                  if (product.productType == ProductType.variable.toString())
                    const SizedBox(height: TSizes.spaceBtwSections),

                  //checkout button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Checkout")),
                  ),
                  //description
                  const SizedBox(height: TSizes.spaceBtwSections),

                  const TSectionHeader(
                      title: "Description", showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? "",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: " Show more",
                    trimExpandedText: " Less ",
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  //reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TSectionHeader(
                        title: "Reviews(199)",
                        onPressd: () {},
                        showActionButton: false,
                      ),
                      IconButton(
                          onPressed: () {
                            Get.to(() => const PitchReviews());
                          },
                          icon: const Icon(
                            Iconsax.arrow_right_3,
                            size: 18,
                          ))
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
