import 'package:flutter/material.dart';
import 'package:football_app/data/repos/authentication.dart';
import 'package:football_app/data/repos/user.dart';
import 'package:football_app/features/authentication/models/userModel.dart';
import 'package:football_app/features/authentication/views/signup/verfiy_Email.dart';
import 'package:football_app/utils/constants/image_strings.dart';
import 'package:football_app/utils/loaders/loaders.dart';
import 'package:football_app/utils/network/networkManager.dart';
import 'package:football_app/utils/popups/fullScreenLoader.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //variables
  final TextEditingController email = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final Rx<bool> hidePassword = true.obs;
  final Rx<bool> tickCheckBox = true.obs;
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  //SignUp
  void signUp() async {
    try {
      //start Loading
      FullScreenLoader.openLoadingDialog(
          "We are processing your information ...",
          TImageStrings.docerAnimation);
      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();

        return;
      }

      //form validation
      if (!signupFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();

        return;
      }

      //privacy policy
      if (tickCheckBox.value == false) {
        TLoaders.warningSnackBar(
            title: "Accept Privacy Policy",
            message:
                "In order to create the account,you must have read and accept the privacy policy and terms of use");
        return;
      }

      //register user in FB authentication

      final userCredential = await AuthenticationRepo.instance
          .registerUserWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //save user data in FS

      final userModel = UserModel(
          id: userCredential.user!.uid,
          firstname: firstname.text.trim(),
          lastname: lastname.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: "");
      final userRepo = Get.put(UserRepo());
      await userRepo.saveUserRecord(userModel);

      //Remove Loader
      FullScreenLoader.stopLoading();

      //show success message

      TLoaders.successSnackBar(
          title: "Congrats",
          message: "Your Account has been created! Verfiy Email to continue");
      //move to verify email
      Get.to(() => VerfiyEmail(
            email: email.text.trim(),
          ));
    } catch (e) {
      //show error message
      FullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
