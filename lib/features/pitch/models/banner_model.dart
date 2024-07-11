import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BannerModel extends GetxController {
  String imageUrl;
  final String targetScreen;
  final bool active;
  BannerModel(
      {required this.active,
      required this.imageUrl,
      required this.targetScreen});

  Map<String, dynamic> toJson() {
    return {
      "imageUrl": imageUrl,
      "targetScreen": targetScreen,
      "active": active
    };
  }

  factory BannerModel.fromSnapShot(DocumentSnapshot snapShot) {
    final data = snapShot.data() as Map<String, dynamic>;
    return BannerModel(
        active: data["active"] ?? "",
        imageUrl: data["imageUrl"] ?? "",
        targetScreen: data["targetScreen"] ?? "");
  }
}
