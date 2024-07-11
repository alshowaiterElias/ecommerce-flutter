import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/appbar/appbar.dart';
import 'package:football_app/common/widgets/texts/sectionHeader.dart';
import 'package:football_app/data/dummyData/dummy_data.dart';
import 'package:football_app/data/repos/banner.dart';
import 'package:football_app/data/repos/brands.dart';
import 'package:football_app/data/repos/catagory.dart';
import 'package:football_app/data/repos/product.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppbar(
        title: Text("Upload Data"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TSectionHeader(
                title: "Main Record",
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TUploadListItem(
                icon: Iconsax.category,
                title: "Upload Category",
                onTap: () {
                  CatagoryRepo.instance.uploadDummyData(TDummyData.catagories);
                },
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TUploadListItem(
                icon: Iconsax.shopping_bag,
                title: "Upload Products",
                onTap: () {
                  ProductRepo.instance.uploadDummyData(TDummyData.products);
                },
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TUploadListItem(
                icon: Iconsax.additem,
                title: "Upload Banners",
                onTap: () {
                  BannerRepo.instance.uploadDummyData(TDummyData.banners);
                },
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TUploadListItem(
                icon: Iconsax.shop,
                title: "Upload Brands",
                onTap: () {
                  Get.put(BrandsRepo()).uploadDummyData(TDummyData.brands);
                },
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const TSectionHeader(
                title: "Relationships",
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TUploadListItem(
                icon: Iconsax.cloud_sunny1,
                title: "Upload Brands & Categories Relation Data",
                onTap: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TUploadListItem(
                icon: Iconsax.stickynote,
                title: "Upload Product Categories Relational Data",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TUploadListItem extends StatelessWidget {
  const TUploadListItem(
      {super.key, required this.icon, required this.title, this.onTap});

  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 3,
              child: Icon(
                icon,
                color: TColors.primaryColor,
                size: 32,
              )),
          Expanded(
            flex: 8,
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
              flex: 4,
              child: IconButton(
                  onPressed: onTap,
                  icon: const Icon(
                    Icons.upload_file_rounded,
                    color: TColors.primaryColor,
                    size: 32,
                  )))
        ],
      ),
    );
  }
}
