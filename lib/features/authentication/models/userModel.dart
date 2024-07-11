import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  String firstname;
  String lastname;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  String get fullName => '$firstname $lastname';
  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUsername(String fullname) {
    List<String> nameparts = fullname.split(" ");
    String firstname = nameparts[0].toLowerCase();
    String lastname = nameparts.length > 1 ? nameparts[1] : "";
    String camelCaseUsername = "$firstname$lastname";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  static UserModel empty() => UserModel(
      id: "",
      firstname: "",
      lastname: "",
      username: "",
      email: "",
      phoneNumber: "",
      profilePicture: "");

//to to store users at FS
  Map<String, dynamic> toJson() {
    return {
      "Firstname": firstname,
      "Lastname": lastname,
      "Username": username,
      "Email": email,
      "PhoneNumber": phoneNumber,
      "ProfilePicture": profilePicture,
    };
  }

//to create user model from a firestore document

  factory UserModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          firstname: data["Firstname"] ?? "",
          lastname: data["Lastname"] ?? "",
          username: data["Username"] ?? "",
          email: data["Email"] ?? "",
          phoneNumber: data["PhoneNumber"] ?? "",
          profilePicture: data["ProfilePicture"] ?? "");
    } else {
      return UserModel.empty();
    }
  }
}
