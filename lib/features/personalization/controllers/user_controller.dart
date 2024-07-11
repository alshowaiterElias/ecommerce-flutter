import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:football_app/data/repos/authentication.dart';
import 'package:football_app/data/repos/user.dart';
import 'package:football_app/features/authentication/models/userModel.dart';
import 'package:football_app/features/authentication/views/login/login.dart';
import 'package:football_app/features/personalization/profile/widgets/re_authenticate_user.dart';
import 'package:football_app/utils/constants/image_strings.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/loaders/loaders.dart';
import 'package:football_app/utils/network/networkManager.dart';
import 'package:football_app/utils/popups/fullScreenLoader.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = false.obs;
  final imageLoading = false.obs;
  final userRepo = Get.put(UserRepo());
  final verfiyEmail = TextEditingController();
  final verfiyPassword = TextEditingController();
  final hidePassword = false.obs;
  GlobalKey<FormState> deleteUserFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepo.fetchUserDetails();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecored(UserCredential? userCredential) async {
    try {
      //refresh user
      await fetchUserRecord();
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          final nameParts =
              UserModel.nameParts(userCredential.user!.displayName ?? "");
          final username = UserModel.generateUsername(
              userCredential.user!.displayName ?? "");

          final user = UserModel(
              id: userCredential.user!.uid,
              firstname: nameParts[0],
              lastname:
                  nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "",
              username: username,
              email: userCredential.user!.email ?? "",
              phoneNumber: userCredential.user!.phoneNumber ?? "",
              profilePicture: userCredential.user!.photoURL ?? "");

          await userRepo.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: "Data not Saved",
          message:
              "Something went wrong while saving,you can resave your data from your profile");
    }
  }

  void deleteUserWarningPopUp() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.md),
        title: "Delete Account",
        middleText:
            "Are you sure you want to delete your Account? This action is not reversible and all your data will be removed permanently",
        confirm: ElevatedButton(
            onPressed: () {
              deleteUserAccount();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                side: const BorderSide(color: Colors.red)),
            child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
                child: Text("Delete"))),
        cancel: OutlinedButton(
            onPressed: () {
              Navigator.of(Get.overlayContext!).pop();
            },
            child: const Text("Cancel")));
  }

  void deleteUserAccount() async {
    try {
      FullScreenLoader.openLoadingDialog(
          "Processing ...", TImageStrings.docerAnimation);
      //First re-Authenticate user
      final auth = AuthenticationRepo.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re Verfiy Email
        if (provider == "google.com") {
          await auth.signInWithGoolge();
          await auth.deleteAccount();
          FullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == "password") {
          FullScreenLoader.stopLoading();
          Get.to(() => const ReAuthenticateUser());
        }
      }
    } catch (e) {
      FullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPassowrdThenDelete() async {
    try {
      FullScreenLoader.openLoadingDialog(
        "Deleting your account",
        TImageStrings.docerAnimation,
      );

      //Check intrnet conictivity

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {}

      // validate
      if (!deleteUserFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepo.instance.reAuthenticateEmailAndPassword(
          verfiyEmail.text.trim(), verfiyPassword.text.trim());
      await AuthenticationRepo.instance.deleteAccount();
      FullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  uploadProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageLoading.value = true;
        //upload image
        final imageUrl =
            await UserRepo.instance.uploadImage("User/Images/Profile/", image);

        //update user image
        Map<String, dynamic> json = {"ProfilePicture": imageUrl};
        await UserRepo.instance.updateUserField(json);

        //update frontend
        user.value.profilePicture = imageUrl;
        user.refresh();
        //snackbar
        TLoaders.successSnackBar(
            title: "Congrtas", message: "Your Profile Picture has changed");
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap", message: "Something went wrong");
    } finally {
      imageLoading.value = false;
    }
  }
}
