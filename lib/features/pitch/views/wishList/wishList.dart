import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/Reservations/reservationCardsVertical.dart';
import 'package:football_app/common/widgets/appbar/appbar.dart';
import 'package:football_app/common/widgets/icons/TCircularIcon.dart';
import 'package:football_app/common/widgets/layout/gridLayout.dart';
import 'package:football_app/common/widgets/loaders/loaderAnimation.dart';
import 'package:football_app/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:football_app/features/pitch/controllers/favourites_controller.dart';
import 'package:football_app/features/pitch/views/home/home.dart';
import 'package:football_app/nav.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:football_app/utils/constants/image_strings.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/helpers/cloud_helper_function.dart';
import 'package:football_app/utils/helpers/helper.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: TAppbar(
        title: Text(
          "WishList",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            backgroundColor: Colors.transparent,
            color: THelperFunctions.isDarkMode(context)
                ? TColors.white
                : TColors.dark,
            onPressed: () => Get.to(() => const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
                future: controller.favouritesProducts(),
                builder: (context, snapshot) {
                  final emptyWidget = TAnimationLoaderWidget(
                    text: "WishList is Empty",
                    animation: TImageStrings.docerAnimation,
                    showAction: true,
                    actionText: "add more",
                    onActionPressed: () =>
                        Get.offAll(() => const NavigationMenu()),
                  );
                  const loader = TVerticalProductShimmer(
                    itemCount: 6,
                  );
                  final widget = TCloudHelperFunction.checkMultiRecordState(
                      snapshot: snapshot,
                      loader: loader,
                      nothingFound: emptyWidget);
                  if (widget != null) return widget;

                  final products = snapshot.data!;

                  return TGridLayout(
                    itemCount: products.length,
                    itemBuilder: (_, index) {
                      return TReservationsVertical(
                        product: products[index],
                      );
                    },
                  );
                }),
          ),
        ),
      ),
    );
  }
}
