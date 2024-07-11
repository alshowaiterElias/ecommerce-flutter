import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
  });

  static BrandModel empty() => BrandModel(id: "", name: "", image: "");

  toJson() {
    return {
      "Id": id,
      "Name": name,
      "Image": image,
      "IsFeatured": isFeatured,
      "ProductsCount": productsCount,
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data["Id"] ?? "",
      name: data["Name"] ?? "",
      image: data["Image"] ?? "",
      isFeatured: data["IsFeatured"] ?? false,
      productsCount: data["ProductsCount"] ?? 0,
    );
  }

  factory BrandModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return BrandModel(
        id: document.id,
        name: data["Name"] ?? "",
        image: data["Image"] ?? "",
        isFeatured: data["IsFeatured"] ?? false,
        productsCount: data["ProductsCount"] ?? 0,
      );
    } else {
      return BrandModel.empty();
    }
  }
}
