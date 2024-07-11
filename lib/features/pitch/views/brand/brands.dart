import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/appbar/appbar.dart';
import 'package:football_app/common/widgets/custom_shapes/Containers/product_details.dart';
import 'package:football_app/common/widgets/layout/gridLayout.dart';
import 'package:football_app/common/widgets/shimmer/brands_shimmer.dart';
import 'package:football_app/common/widgets/texts/sectionHeader.dart';
import 'package:football_app/features/pitch/controllers/brand_controller.dart';
import 'package:football_app/features/pitch/views/brand/brandProduts.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:get/get.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: const TAppbar(
        title: Text("Brands"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TSectionHeader(title: "Brands"),
              const SizedBox(height: TSizes.spaceBtwItems),
              //Brands
              Obx(() {
                if (controller.isLoading.value) {
                  return const TBrandsShimmer();
                }
                if (controller.allBrands.isEmpty) {
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
                  itemCount: controller.allBrands.length,
                  itemBuilder: (_, index) {
                    final brand = controller.allBrands[index];
                    return TProductDetails(
                      brand: brand,
                      onTap: () => Get.to(() => BrandProducts(brand: brand)),
                    );
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
