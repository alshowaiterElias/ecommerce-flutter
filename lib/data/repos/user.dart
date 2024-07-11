import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:football_app/data/repos/authentication.dart';
import 'package:football_app/features/authentication/models/userModel.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserRepo extends GetxController {
  static UserRepo get instance => Get.find();

  //variables
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //function to save user record to db
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } catch (e) {
      throw 'Something Went Wrong,Please try again';
    }
  }

  //Fetch user details based on id
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepo.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapShot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } catch (e) {
      throw 'Something Went Wrong,Please try again';
    }
  }

  //update user
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepo.instance.authUser?.uid)
          .update(updatedUser.toJson());
    } catch (e) {
      throw 'Something Went Wrong,Please try again';
    }
  }

  //update a field
  Future<void> updateUserField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepo.instance.authUser?.uid)
          .update(json);
    } catch (e) {
      throw 'Something Went Wrong,Please try again';
    }
  }

  //remove user from FS
  Future<void> removeUserRecord(String userID) async {
    try {
      await _db.collection("Users").doc(userID).delete();
    } catch (e) {
      throw 'Something Went Wrong,Please try again';
    }
  }

  //Upload Image

  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      throw 'Something went wrong';
    }
  }
}
