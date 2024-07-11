import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/pitches/pitchShowcase.dart';
import 'package:football_app/common/widgets/shimmer/boxed_shimmer.dart';
import 'package:football_app/common/widgets/shimmer/list_shimmer.dart';
import 'package:football_app/features/pitch/controllers/brand_controller.dart';
import 'package:football_app/features/pitch/models/catagory_model.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/helpers/cloud_helper_function.dart';

class CatagoryBrands extends StatelessWidget {
  const CatagoryBrands({super.key, required this.catagory});

  final CatagoryModel catagory;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandsForCatagory(catagory.id),
        builder: (context, snapshot) {
          const loader = Column(
            children: [
              TListTileShimmer(),
              SizedBox(height: TSizes.spaceBtwItems),
              TBoxedShimmer(),
              SizedBox(height: TSizes.spaceBtwItems),
            ],
          );

          final widget = TCloudHelperFunction.checkMultiRecordState(
              snapshot: snapshot, loader: loader);
          if (widget != null) return widget;

          final brands = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (context, index) {
              final brand = brands[index];
              return FutureBuilder(
                  future:
                      controller.getBrandProducts(brandId: brand.id, limit: 3),
                  builder: (context, snapshot) {
                    final widget = TCloudHelperFunction.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    final products = snapshot.data!;

                    return TPitchShowCase(
                      brand: brand,
                      images: products.map((e) => e.thumbNail).toList(),
                    );
                  });
            },
          );
        });
  }
}
