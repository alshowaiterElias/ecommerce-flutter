import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCatagoryModel {
  final String productId;
  final String catagoryId;

  ProductCatagoryModel({required this.productId, required this.catagoryId});

  Map<String, dynamic> toJson() {
    return {"productId": productId, "catagoryId": catagoryId};
  }

  factory ProductCatagoryModel.fromSnapShot(DocumentSnapshot snapShot) {
    final data = snapShot.data() as Map<String, dynamic>;
    return ProductCatagoryModel(
      productId: data["productId"] as String,
      catagoryId: data["catagoryId"] as String,
    );
  }
}
