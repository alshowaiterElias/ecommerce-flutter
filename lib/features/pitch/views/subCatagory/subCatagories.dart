import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/Reservations/productCardHorizontal.dart';
import 'package:football_app/common/widgets/appbar/appbar.dart';
import 'package:football_app/common/widgets/images/roundedImages.dart';
import 'package:football_app/common/widgets/shimmer/horizantal_shimmer_effect.dart';
import 'package:football_app/common/widgets/texts/sectionHeader.dart';
import 'package:football_app/features/pitch/controllers/catagory_controller.dart';
import 'package:football_app/features/pitch/models/catagory_model.dart';
import 'package:football_app/features/pitch/views/allProducts/allProducts.dart';
import 'package:football_app/utils/constants/image_strings.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/helpers/cloud_helper_function.dart';
import 'package:get/get.dart';

class SubCatagoriesScreen extends StatelessWidget {
  const SubCatagoriesScreen({super.key, required this.catagory});

  final CatagoryModel catagory;

  @override
  Widget build(BuildContext context) {
    final controller = CatagoryController.instance;
    return Scaffold(
      appBar: TAppbar(
        title: Text(catagory.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TRoundedImage(
                  imgUrl: TImageStrings.slider2,
                  width: double.infinity,
                  applyImageRaduis: true),
              const SizedBox(height: TSizes.spaceBtwSections),
              FutureBuilder(
                  future: controller.getSubCatagories(catagory.id),
                  builder: (context, snapshot) {
                    const loader = THorizantalShimmerEffect();
                    final widget = TCloudHelperFunction.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;
                    final subCatagories = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: subCatagories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final subCatagory = subCatagories[index];
                        return FutureBuilder(
                            future: controller.getCatagoryProduct(
                                catagoryId: subCatagory.id),
                            builder: (context, snapshot) {
                              final widget =
                                  TCloudHelperFunction.checkMultiRecordState(
                                      snapshot: snapshot, loader: loader);
                              if (widget != null) return widget;
                              final products = snapshot.data!;
                              return Column(
                                children: [
                                  TSectionHeader(
                                    title: subCatagory.name,
                                    showActionButton: true,
                                    onPressd: () =>
                                        Get.to(() => AllProductsScreen(
                                              title: subCatagory.name,
                                              futureMethod:
                                                  controller.getCatagoryProduct(
                                                      catagoryId:
                                                          subCatagory.id,
                                                      limit: -1),
                                            )),
                                  ),
                                  const SizedBox(
                                      height: TSizes.spaceBtwItems / 2),
                                  SizedBox(
                                    height: 120,
                                    child: ListView.separated(
                                        itemCount: products.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return TProductCardHorizontal(
                                              product: products[index]);
                                        },
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                                width: TSizes.spaceBtwItems)),
                                  )
                                ],
                              );
                            });
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
