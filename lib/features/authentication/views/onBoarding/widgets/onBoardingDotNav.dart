import 'package:flutter/material.dart';
import 'package:football_app/features/authentication/controllers/onBoardingController.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/device/device_utility.dart';
import 'package:football_app/utils/helpers/helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNav extends StatelessWidget {
  const OnBoardingDotNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Onboardingcontroller.instance;
    final bool isDark = THelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationHeight() + 25,
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        effect: ExpandingDotsEffect(
            activeDotColor: isDark ? TColors.light : TColors.dark,
            dotHeight: 6),
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
      ),
    );
  }
}
