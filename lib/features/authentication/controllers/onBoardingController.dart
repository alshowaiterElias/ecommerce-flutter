import 'package:flutter/material.dart';
import 'package:football_app/features/authentication/views/login/login.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Onboardingcontroller extends GetxController {
  static Onboardingcontroller get instance => Get.find();

  //variables
  PageController pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  //functions
  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      final deviceStorage = GetStorage();
      deviceStorage.write("IsFirstTime", false);
      Get.offAll(() => const LoginScreen());
    } else {
      pageController.jumpToPage(currentPageIndex.value + 1);
    }
  }

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
