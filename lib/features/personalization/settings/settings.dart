import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/appbar/appbar.dart';
import 'package:football_app/common/widgets/custom_shapes/Containers/primaryHeaderContainer.dart';
import 'package:football_app/common/widgets/texts/sectionHeader.dart';
import 'package:football_app/common/widgets/user/settingMenu.dart';
import 'package:football_app/common/widgets/user/userProfileTile.dart';
import 'package:football_app/data/repos/authentication.dart';
import 'package:football_app/features/personalization/addresses/addresses.dart';
import 'package:football_app/features/personalization/settings/upload.dart';
import 'package:football_app/features/pitch/views/orders/orders.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                TAppbar(
                  title: Text(
                    "Account",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.white),
                  ),
                ),
                const TUserProfileTile(),
                const SizedBox(height: TSizes.spaceBtwSections)
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeader(
                      title: "Account Settings", showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingMenuTile(
                      title: "My Addresses",
                      subTitle: "set shopping delivary address",
                      icon: Iconsax.safe_home,
                      onTap: () {
                        Get.to(() => const AddressesScreen());
                      }),
                  TSettingMenuTile(
                      title: "My Orders",
                      subTitle: "In Progress and Completed Orders",
                      icon: Iconsax.bag_tick,
                      onTap: () {
                        Get.to(() => const OrdersScreen());
                      }),
                  TSettingMenuTile(
                      title: "Notification",
                      subTitle: "Set any kind of notification setting",
                      icon: Iconsax.notification,
                      onTap: () {}),
                  TSettingMenuTile(
                      title: "Account Privacy",
                      subTitle: "Manage data usage and contacted accounts",
                      icon: Iconsax.security_card,
                      onTap: () {}),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSectionHeader(
                      title: "Application Settings", showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingMenuTile(
                    title: "Load data",
                    subTitle: "upload data to cloud firebase",
                    icon: Iconsax.document_upload,
                    onTap: () {
                      Get.to(() => const UploadScreen());
                    },
                  ),
                  TSettingMenuTile(
                    title: "Geo Location",
                    subTitle: "set Recommendation based on location",
                    icon: Iconsax.location,
                    trailing: Switch(value: true, onChanged: (value) {}),
                    onTap: () {},
                  ),
                  TSettingMenuTile(
                    title: "Safe Mode",
                    subTitle: "Search result is safe for ages",
                    icon: Iconsax.security_user,
                    trailing: Switch(value: false, onChanged: (value) {}),
                    onTap: () {},
                  ),
                  TSettingMenuTile(
                    title: "HD Image Quality",
                    subTitle: "set image quaility to be seen",
                    icon: Iconsax.image,
                    trailing: Switch(value: false, onChanged: (value) {}),
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {
                          AuthenticationRepo.instance.logout();
                        },
                        child: const Text("Logout")),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections * 2.5,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
