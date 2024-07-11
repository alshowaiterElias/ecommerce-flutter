import 'package:flutter/widgets.dart';
import 'package:football_app/data/repos/authentication.dart';
import 'package:football_app/features/personalization/controllers/user_controller.dart';
import 'package:football_app/utils/constants/image_strings.dart';
import 'package:football_app/utils/loaders/loaders.dart';
import 'package:football_app/utils/network/networkManager.dart';
import 'package:football_app/utils/popups/fullScreenLoader.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  //variables
  final Rx<bool> rememberMe = true.obs;
  final Rx<bool> hidePassword = true.obs;
  final localStorage = GetStorage();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read("REMEMBER_ME_EMAIL") ?? "";
    password.text = localStorage.read("REMEMBER_ME_PASSWORD") ?? "";
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      //start Loading
      FullScreenLoader.openLoadingDialog(
          "Logging you in ...", TImageStrings.docerAnimation);

      //Check intrnet conictivity

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if (!loginFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //save data if remember me

      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      //Login user with Email and Password authentecate
      await AuthenticationRepo.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //Remove Loader
      FullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepo.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
          title: "OnSnap", message: "Something went wrong please try again");
    }
  }

  Future<void> googleSingIn() async {
    // try {
    // start loading
    FullScreenLoader.openLoadingDialog(
        "Logging you in ...", TImageStrings.docerAnimation);

    //check internet connictivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      FullScreenLoader.stopLoading();
      return;
    }

    //Google Authenticate
    final userCredential = await AuthenticationRepo.instance.signInWithGoolge();

    //save user data
    userController.saveUserRecored(userCredential);

    //stop loading
    FullScreenLoader.stopLoading();

    //Redirect
    AuthenticationRepo.instance.screenRedirect();
    // }
    // catch (e) {
    //   FullScreenLoader.stopLoading();
    //   TLoaders.errorSnackBar(
    //       title: "OnSnap", message: "Something went wrong please try again");
    // }
  }
}
