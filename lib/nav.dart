import 'package:flutter/material.dart';
import 'package:football_app/features/personalization/settings/settings.dart';
import 'package:football_app/features/pitch/views/home/home.dart';
import 'package:football_app/features/pitch/views/pitches/pitches.dart';
import 'package:football_app/features/pitch/views/wishList/wishList.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:football_app/utils/helpers/helper.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final bool isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: isDark ? TColors.balck : TColors.white,
          indicatorColor: isDark
              ? TColors.white.withOpacity(0.1)
              : TColors.balck.withOpacity(0.1),
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
            NavigationDestination(icon: Icon(Iconsax.shop), label: "Shop"),
            NavigationDestination(
                icon: Icon(Iconsax.heart), label: "Wish list"),
            NavigationDestination(icon: Icon(Iconsax.user), label: "User"),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const Pitches(),
    const Wishlist(),
    const SettingsScreen(),
  ];
}
