import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/Reservations/reservationCardsVertical.dart';
import 'package:football_app/common/widgets/custom_shapes/Containers/primaryHeaderContainer.dart';
import 'package:football_app/common/widgets/custom_shapes/Containers/searchBoxContainer.dart';
import 'package:football_app/common/widgets/layout/gridLayout.dart';
import 'package:football_app/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:football_app/common/widgets/texts/sectionHeader.dart';
import 'package:football_app/features/pitch/controllers/product_controller.dart';
import 'package:football_app/features/pitch/views/allProducts/allProducts.dart';
import 'package:football_app/features/pitch/views/home/widgets/homeAppbar.dart';
import 'package:football_app/features/pitch/views/home/widgets/homeHorizantalScrollSection.dart';
import 'package:football_app/features/pitch/views/home/widgets/homeSlider.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //HEADER
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //AppBar
                  const THomeAppbar(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  //SearchBox
                  const TSearchContainer(
                    text: TTextStrings.searchBarText,
                    icon: Iconsax.search_normal,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  //Scrolling Section
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        // Title
                        TSectionHeader(
                            title: TTextStrings.myPitches,
                            showActionButton: false,
                            onPressd: () {}),
                        const SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),
                        // Image-Text
                        const THorizantalListSection()
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections)
                ],
              ),
            ),
            //BODY
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSlider(),

                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TSectionHeader(
                    title: "Popular Products",
                    onPressd: () {
                      Get.to(() => AllProductsScreen(
                            title: "Popular Products",
                            futureMethod: controller.fetchAllFeaturedProduct(),
                          ));
                    },
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  //Grid
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const TVerticalProductShimmer();
                    }
                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                        child: Text(
                          "No Data found",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }
                    return TGridLayout(
                        itemCount: controller.featuredProducts.length,
                        itemBuilder: (_, index) {
                          return TReservationsVertical(
                            product: controller.featuredProducts[index],
                          );
                        });
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
