import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:football_app/common/widgets/successScreen/successScreen1.dart';
import 'package:football_app/data/repos/authentication.dart';
import 'package:football_app/utils/constants/image_strings.dart';
import 'package:football_app/utils/constants/text_strings.dart';
import 'package:football_app/utils/loaders/loaders.dart';
import 'package:get/get.dart';

class VerfiyEmailController extends GetxController {
  static VerfiyEmailController get instance => Get.find();

  //send email whenever verfiy screen appears & set timer to auto redirect
  @override
  void onInit() {
    // TODO: implement onInit
    sendEmailVerification();
    setTimerToAutoRedirect();
    super.onInit();
  }

  //send email verfication link
  sendEmailVerification() async {
    try {
      await AuthenticationRepo.instance.sendEmailVerfication();
      TLoaders.successSnackBar(
          title: "Email Sent", message: "Please check your email inbox");
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  //timer to auto redirct
  setTimerToAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;

      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => Successscreen1(
            image: TImageStrings.slider1,
            title: TTextStrings.accountCreatedTitle,
            subtitle: TTextStrings.accountCreatedSubTitle,
            onPressed: () {
              AuthenticationRepo.instance.screenRedirect();
            }));
      }
    });
  }

  //manually check if email is verfied
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => Successscreen1(
          image: TImageStrings.slider1,
          title: TTextStrings.accountCreatedTitle,
          subtitle: TTextStrings.accountCreatedSubTitle,
          onPressed: () {
            AuthenticationRepo.instance.screenRedirect();
          }));
    }
  }
}
