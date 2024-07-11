import 'package:flutter/material.dart';
import 'package:football_app/features/authentication/controllers/onBoardingController.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppbarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () {
          Onboardingcontroller.instance.skipPage();
        },
        child: const Text("Skip"),
      ),
    );
  }
}
