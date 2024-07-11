import 'package:flutter/material.dart';
import 'package:football_app/features/authentication/controllers/onBoardingController.dart';
import 'package:football_app/features/authentication/views/onBoarding/widgets/onBoardingDotNav.dart';
import 'package:football_app/features/authentication/views/onBoarding/widgets/onBoardingNextPage.dart';
import 'package:football_app/features/authentication/views/onBoarding/widgets/onBoardingPage_scroll.dart';
import 'package:football_app/features/authentication/views/onBoarding/widgets/onBoardingSkip.dart';
import 'package:football_app/utils/constants/image_strings.dart';
import 'package:football_app/utils/constants/text_strings.dart';

import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final constroller = Get.put(Onboardingcontroller());

    return Scaffold(
      body: Stack(
        //Horizantal scrollable pages
        children: [
          PageView(
            controller: constroller.pageController,
            onPageChanged: constroller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImageStrings.onBoarrdingImage1,
                title: TTextStrings.onBoardingTitle1,
                subtitle: TTextStrings.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImageStrings.onBoarrdingImage2,
                title: TTextStrings.onBoardingTitle2,
                subtitle: TTextStrings.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImageStrings.onBoarrdingImage3,
                title: TTextStrings.onBoardingTitle3,
                subtitle: TTextStrings.onBoardingSubTitle3,
              ),
            ],
          ),

          //skip button
          const OnBoardingSkip(),
          //dot navigation
          const OnBoardingDotNav(),
          // circular button
          const OnBoardingArrow()
        ],
      ),
    );
  }
}
