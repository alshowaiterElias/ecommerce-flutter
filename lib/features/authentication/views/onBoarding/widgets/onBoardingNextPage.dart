import 'package:flutter/material.dart';
import 'package:football_app/features/authentication/controllers/onBoardingController.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/device/device_utility.dart';
import 'package:football_app/utils/helpers/helper.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingArrow extends StatelessWidget {
  const OnBoardingArrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = THelperFunctions.isDarkMode(context);

    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationHeight(),
      child: ElevatedButton(
        onPressed: () {
          Onboardingcontroller.instance.nextPage();
        },
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: isDark ? TColors.primaryColor : TColors.dark),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
