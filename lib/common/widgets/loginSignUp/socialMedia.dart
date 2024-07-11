import 'package:flutter/material.dart';
import 'package:football_app/features/authentication/controllers/login_controllers.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {
              controller.googleSingIn();
            },
            icon: const Image(
              width: TSizes.iconsMd,
              height: TSizes.iconsMd,
              image: AssetImage(TImageStrings.googleIcon),
            ),
          ),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: TSizes.iconsMd,
              height: TSizes.iconsMd,
              image: AssetImage(TImageStrings.facebookIcon),
            ),
          ),
        ),
      ],
    );
  }
}
