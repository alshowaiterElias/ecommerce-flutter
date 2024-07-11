import 'package:flutter/widgets.dart';
import 'package:football_app/data/repos/authentication.dart';
import 'package:football_app/features/authentication/views/password_config/resetPassword.dart';
import 'package:football_app/utils/constants/image_strings.dart';
import 'package:football_app/utils/loaders/loaders.dart';
import 'package:football_app/utils/network/networkManager.dart';
import 'package:football_app/utils/popups/fullScreenLoader.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  //variables
  final email = TextEditingController();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  Future sendPasswordResetEmail() async {
    try {
      FullScreenLoader.openLoadingDialog(
          "Processing your request ....", TImageStrings.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!forgotPasswordFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //send email
      await AuthenticationRepo.instance.forgotPasswrod(email.text.trim());

      //remove loader
      FullScreenLoader.stopLoading();

      //Message
      TLoaders.successSnackBar(
          title: "Email Sent",
          message: "Email Link is sent to reset your password".tr);

      //redirect
      Get.to(() => Resetpassword(
            email: email.text.trim(),
          ));
    } catch (e) {
      throw e.toString();
    }
  }

  Future resendPasswordResetEmail(String email) async {
    try {
      FullScreenLoader.openLoadingDialog(
          "Processing your request ....", TImageStrings.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //send email
      await AuthenticationRepo.instance.forgotPasswrod(email);

      //remove loader
      FullScreenLoader.stopLoading();

      //Message
      TLoaders.successSnackBar(
          title: "Email Sent",
          message: "Email Link is sent to reset your password".tr);
    } catch (e) {
      throw e.toString();
    }
  }
}
