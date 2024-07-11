import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/Reservations/reservationCardsVertical.dart';
import 'package:football_app/common/widgets/layout/gridLayout.dart';
import 'package:football_app/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:football_app/common/widgets/texts/sectionHeader.dart';
import 'package:football_app/features/pitch/controllers/catagory_controller.dart';
import 'package:football_app/features/pitch/models/catagory_model.dart';
import 'package:football_app/features/pitch/views/allProducts/allProducts.dart';
import 'package:football_app/features/pitch/views/pitches/widgets/catagory_brands.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/helpers/cloud_helper_function.dart';
import 'package:get/get.dart';

class TCatagoryTap extends StatelessWidget {
  const TCatagoryTap({super.key, required this.catagory});

  final CatagoryModel catagory;

  @override
  Widget build(BuildContext context) {
    final controller = CatagoryController.instance;
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                CatagoryBrands(catagory: catagory),
                const SizedBox(height: TSizes.spaceBtwItems),
                CatagoryProducts(controller: controller, catagory: catagory),
              ],
            ),
          ),
        ]);
  }
}

class CatagoryProducts extends StatelessWidget {
  const CatagoryProducts({
    super.key,
    required this.controller,
    required this.catagory,
  });

  final CatagoryController controller;
  final CatagoryModel catagory;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.getCatagoryProduct(catagoryId: catagory.id),
        builder: (context, snapshot) {
          final widget = TCloudHelperFunction.checkMultiRecordState(
              snapshot: snapshot, loader: const TVerticalProductShimmer());

          if (widget != null) return widget;

          final products = snapshot.data!;

          return Column(
            children: [
              TSectionHeader(
                title: "You might Like",
                onPressd: () => Get.to(() => AllProductsScreen(
                      title: catagory.name,
                      futureMethod: controller.getCatagoryProduct(
                          catagoryId: catagory.id, limit: -1),
                    )),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TGridLayout(
                  itemCount: products.length,
                  itemBuilder: (_, index) => TReservationsVertical(
                        product: products[index],
                      )),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          );
        });
  }
}
