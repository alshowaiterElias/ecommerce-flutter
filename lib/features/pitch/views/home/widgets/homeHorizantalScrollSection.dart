import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/image_text/verticalImageWithText.dart';
import 'package:football_app/common/widgets/shimmer/catagory_shimmer.dart';
import 'package:football_app/features/pitch/controllers/catagory_controller.dart';
import 'package:football_app/features/pitch/views/subCatagory/subCatagories.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:get/get.dart';

class THorizantalListSection extends StatelessWidget {
  const THorizantalListSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CatagoryController());
    return Obx(() {
      if (controller.isLoading.value == true) return const TCatagoryShimmer();
      if (controller.featuredCatagories.isEmpty) {
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
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.featuredCatagories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return TVerticalImageWithText(
              backgroundColor: TColors.white,
              isNetworkImage: true,
              image: controller.featuredCatagories[index].image,
              text: controller.featuredCatagories[index].name,
              textColor: TColors.white,
              onTap: () {
                Get.to(() => SubCatagoriesScreen(
                      catagory: controller.featuredCatagories[index],
                    ));
              },
            );
          },
        ),
      );
    });
  }
}
