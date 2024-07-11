import 'package:cloud_firestore/cloud_firestore.dart';

class CatagoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CatagoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.parentId = '',
    required this.isFeatured,
  });

  static CatagoryModel empty() =>
      CatagoryModel(id: "", name: "", image: "", isFeatured: false);

  Map<String, dynamic> toJson() {
    return {
      "Name": name,
      "Image": image,
      "ParentId": parentId,
      "isFeatured": isFeatured
    };
  }

  factory CatagoryModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return CatagoryModel(
          id: document.id,
          name: data["Name"] ?? "",
          image: data["Image"] ?? "",
          isFeatured: data["isFeatured"] ?? false,
          parentId: data["parentId"] ?? "");
    } else {
      return CatagoryModel.empty();
    }
  }
}
