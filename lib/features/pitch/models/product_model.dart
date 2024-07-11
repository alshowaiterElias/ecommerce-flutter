import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:football_app/features/pitch/models/brand_model.dart';
import 'package:football_app/features/pitch/models/product_attribute_model.dart';
import 'package:football_app/features/pitch/models/product_variation_model.dart';

class ProductModel {
  String id;
  String title;
  String thumbNail;
  String productType;
  String? sku;
  String? description;
  String? catagoryId;
  int stock;
  double price;
  double salePrice;
  DateTime? date;
  bool? isFeatured;
  List<String>? images;
  BrandModel? brand;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;
  ProductModel(
      {required this.id,
      required this.title,
      required this.thumbNail,
      required this.price,
      required this.productType,
      required this.stock,
      this.salePrice = 0.0,
      this.catagoryId,
      this.date,
      this.images,
      this.description,
      this.isFeatured,
      this.sku,
      this.brand,
      this.productAttributes,
      this.productVariations});

  static ProductModel empty() => ProductModel(
      id: "", title: "", thumbNail: "", price: 0, productType: "", stock: 0);

  toJson() {
    return {
      "SKU": sku,
      "Id": id,
      "IsFeatured": isFeatured,
      "Title": title,
      "ThumbNail": thumbNail,
      "Price": price,
      "SalePrice": salePrice,
      "ProductType": productType,
      "Stock": stock,
      "CatagoryId": catagoryId,
      "Brand": brand!.toJson(),
      "ProductAttributes": productAttributes != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : [],
      "ProductVariations": productVariations != null
          ? productVariations!.map((e) => e.toJson()).toList()
          : [],
      "Date": date,
      "Images": images ?? [],
      "Description": description,
    };
  }

  factory ProductModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return ProductModel(
      id: document.id,
      sku: data["SKU"],
      title: data["Title"],
      stock: data["Stock"] ?? 0,
      isFeatured: data["IsFeatured"] ?? false,
      price: double.parse((data["Price"] ?? 0.0).toString()),
      salePrice: double.parse((data["SalePrice"] ?? 0.0).toString()),
      productType: data["ProductType"] ?? "",
      thumbNail: data["ThumbNail"] ?? "",
      catagoryId: data["CatagoryId"] ?? "",
      description: data["Description"] ?? "",
      brand: BrandModel.fromJson(data["Brand"]),
      images: data["Images"] != null ? List<String>.from(data["Images"]) : [],
      productAttributes: (data["ProductAttributes"] as List<dynamic>)
          .map((e) => ProductAttributeModel.fromJson(e))
          .toList(),
      productVariations: (data["ProductVariations"] as List<dynamic>)
          .map((e) => ProductVariationModel.fromJson(e))
          .toList(),
      date: data["Date"],
    );
  }

  factory ProductModel.fromQuerySnapShot(
      QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      sku: data["SKU"] ?? "",
      title: data["Title"] ?? "",
      stock: data["Stock"] ?? 0,
      isFeatured: data["IsFeatured"] ?? false,
      price: double.parse((data["Price"] ?? 0.0).toString()),
      salePrice: double.parse((data["SalePrice"] ?? 0.0).toString()),
      productType: data["ProductType"] ?? "",
      thumbNail: data["ThumbNail"] ?? "",
      catagoryId: data["CatagoryId"] ?? "",
      description: data["Description"] ?? "",
      brand: BrandModel.fromJson(data["Brand"]),
      images: data["Images"] != null ? List<String>.from(data["Images"]) : [],
      productAttributes: (data["ProductAttributes"] as List<dynamic>)
          .map((e) => ProductAttributeModel.fromJson(e))
          .toList(),
      productVariations: (data["ProductVariations"] as List<dynamic>)
          .map((e) => ProductVariationModel.fromJson(e))
          .toList(),
      date: data["Date"],
    );
  }
}
