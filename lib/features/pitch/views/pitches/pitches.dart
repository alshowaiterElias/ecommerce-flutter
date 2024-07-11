import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/CustomIcons/notificationIcon.dart';
import 'package:football_app/common/widgets/appbar/appbar.dart';
import 'package:football_app/common/widgets/appbar/tabBar.dart';
import 'package:football_app/common/widgets/custom_shapes/Containers/product_details.dart';
import 'package:football_app/common/widgets/custom_shapes/Containers/searchBoxContainer.dart';
import 'package:football_app/common/widgets/layout/gridLayout.dart';
import 'package:football_app/common/widgets/shimmer/brands_shimmer.dart';
import 'package:football_app/common/widgets/texts/sectionHeader.dart';
import 'package:football_app/features/pitch/controllers/brand_controller.dart';
import 'package:football_app/features/pitch/controllers/catagory_controller.dart';
import 'package:football_app/features/pitch/views/brand/brandProduts.dart';
import 'package:football_app/features/pitch/views/brand/brands.dart';
import 'package:football_app/features/pitch/views/pitches/widgets/catagoryTap.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/helpers/helper.dart';
import 'package:get/get.dart';

class Pitches extends StatelessWidget {
  const Pitches({super.key});

  @override
  Widget build(BuildContext context) {
    final catagories = CatagoryController.instance.featuredCatagories;
    final controller = Get.put(BrandController());
    return DefaultTabController(
      length: catagories.length,
      child: Scaffold(
        appBar: TAppbar(
          title: Text(
            "Pitch",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartIcon(
              iconColor: THelperFunctions.isDarkMode(context)
                  ? TColors.white
                  : TColors.dark,
            )
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: THelperFunctions.isDarkMode(context)
                        ? TColors.dark
                        : TColors.white,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
                        padding: const EdgeInsets.all(TSizes.defaultSpace),
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            //Search bar
                            const SizedBox(height: TSizes.spaceBtwItems),
                            const TSearchContainer(
                                text: "Search",
                                showBorder: true,
                                showBackground: false,
                                padding: EdgeInsets.zero),
                            const SizedBox(height: TSizes.spaceBtwItems),

                            //Header Section
                            TSectionHeader(
                              title: "Pitches OverView",
                              onPressd: () {
                                Get.to(() => const BrandsScreen());
                              },
                            ),
                            const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                            //Grid
                            Obx(() {
                              if (controller.isLoading.value) {
                                return const TBrandsShimmer();
                              }
                              if (controller.featuredBrands.isEmpty) {
                                return Center(
                                  child: Text(
                                    "No Data Found",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .apply(color: Colors.white),
                                  ),
                                );
                              }
                              return TGridLayout(
                                mainAxiesExtent: 80,
                                itemCount: controller.featuredBrands.length,
                                itemBuilder: (_, index) {
                                  final brand =
                                      controller.featuredBrands[index];
                                  return TProductDetails(
                                    onTap: () => Get.to(
                                        () => BrandProducts(brand: brand)),
                                    brand: brand,
                                  );
                                },
                              );
                            })
                          ],
                        )),
                    bottom: TTabBar(
                        tabs: catagories
                            .map((catagory) => Tab(
                                  child: Text(catagory.name),
                                ))
                            .toList())),
              ];
            },
            body: TabBarView(
                children: catagories
                    .map((catagory) => TCatagoryTap(
                          catagory: catagory,
                        ))
                    .toList())),
      ),
    );
  }
}
