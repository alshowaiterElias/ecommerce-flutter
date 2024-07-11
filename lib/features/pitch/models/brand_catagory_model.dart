import 'package:cloud_firestore/cloud_firestore.dart';

class BrandCatagoryModel {
  final String brandId;
  final String catagoryId;

  BrandCatagoryModel({required this.brandId, required this.catagoryId});

  Map<String, dynamic> toJson() {
    return {"brandId": brandId, "catagoryId": catagoryId};
  }

  factory BrandCatagoryModel.fromSnapShot(DocumentSnapshot snapShot) {
    final data = snapShot.data() as Map<String, dynamic>;
    return BrandCatagoryModel(
      brandId: data["brandId"] as String,
      catagoryId: data["catagoryId"] as String,
    );
  }
}
