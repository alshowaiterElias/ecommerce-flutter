import 'package:flutter/widgets.dart';
import 'package:football_app/data/repos/user.dart';
import 'package:football_app/features/personalization/controllers/user_controller.dart';
import 'package:football_app/features/personalization/profile/profile.dart';
import 'package:football_app/utils/constants/image_strings.dart';
import 'package:football_app/utils/loaders/loaders.dart';
import 'package:football_app/utils/network/networkManager.dart';
import 'package:football_app/utils/popups/fullScreenLoader.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  GlobalKey<FormState> updateUserNameKey = GlobalKey<FormState>();
  final firstname = TextEditingController();
  final lasttname = TextEditingController();
  final userController = UserController.instance;
  final userRepo = Get.put(UserRepo());

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstname.text = userController.user.value.firstname;
    lasttname.text = userController.user.value.lastname;
  }

  Future<void> updateUserName() async {
    try {
      FullScreenLoader.openLoadingDialog(
          "We are updating your information", TImageStrings.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!updateUserNameKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //update on Firestore
      Map<String, dynamic> name = {
        "FirstName": firstname.text.trim(),
        "LastName": lasttname.text.trim()
      };
      await userRepo.updateUserField(name);

      //update on profile screen
      userController.user.value.firstname = firstname.text.trim();
      userController.user.value.lastname = lasttname.text.trim();

      //stop loading
      FullScreenLoader.stopLoading();

      //show message & redirect
      TLoaders.successSnackBar(
          title: "Congratulations", message: "your name has been updated");
      Get.off(() => const ProfileScreen());
    } catch (e) {
      throw 'Something went wrong';
    }
  }
}
