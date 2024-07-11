import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/loaders/loaderAnimation.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:football_app/utils/helpers/helper.dart';
import 'package:get/get.dart';

class FullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
          canPop: false,
          child: Container(
            color: THelperFunctions.isDarkMode(Get.context!)
                ? TColors.dark
                : TColors.white,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 250,
                ),
                TAnimationLoaderWidget(text: text, animation: animation)
              ],
            ),
          )),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
