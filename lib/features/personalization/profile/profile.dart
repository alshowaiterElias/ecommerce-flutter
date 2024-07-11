import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/appbar/appbar.dart';
import 'package:football_app/common/widgets/images/circularImages.dart';
import 'package:football_app/common/widgets/shimmer/shimmer_effect.dart';
import 'package:football_app/common/widgets/texts/sectionHeader.dart';
import 'package:football_app/features/personalization/controllers/user_controller.dart';
import 'package:football_app/features/personalization/profile/widgets/change_name.dart';
import 'package:football_app/features/personalization/profile/widgets/profileMenu.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:football_app/utils/constants/image_strings.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppbar(
        showBackArrow: true,
        title: Text(
          "Profile",
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .apply(color: TColors.dark),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : TImageStrings.google3;
                      return controller.imageLoading.value
                          ? const TShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : TCircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                        onPressed: () {
                          controller.uploadProfilePicture();
                        },
                        child: const Text("Change profile picture")),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeader(
                  title: "Profile Informarion", showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenuItem(
                title: "Name",
                value: controller.user.value.fullName,
                onPressed: () {
                  Get.to(() => const ChangeNameScreen());
                },
              ),
              TProfileMenuItem(
                title: "Username",
                value: controller.user.value.username,
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeader(title: "Personal Information"),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenuItem(
                title: "User ID",
                value: controller.user.value.id,
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              TProfileMenuItem(
                title: "E-Mail",
                value: controller.user.value.email,
                onPressed: () {},
              ),
              TProfileMenuItem(
                title: "Phone Number",
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              TProfileMenuItem(
                title: "Gender",
                value: "Male",
                onPressed: () {},
              ),
              TProfileMenuItem(
                title: "Date of birth",
                value: "17 Mar,1997",
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              Center(
                child: TextButton(
                  child: const Text(
                    "Close Account",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    controller.deleteUserWarningPopUp();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
