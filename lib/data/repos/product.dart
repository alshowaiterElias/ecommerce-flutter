import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:football_app/data/services/firebase_storage_service.dart';
import 'package:football_app/features/pitch/models/product_model.dart';
import 'package:football_app/utils/constants/enums.dart';
import 'package:football_app/utils/loaders/loaders.dart';
import 'package:get/get.dart';

class ProductRepo extends GetxController {
  static ProductRepo get instance => Get.find();

  //variables
  final _db = FirebaseFirestore.instance;

  Future<void> uploadDummyData(List<ProductModel> products) async {
    final storage = Get.put(FirebaseStorageService());

    for (var product in products) {
      final thumbNail = await storage.getImageDataFromAsset(product.thumbNail);

      final url = await storage.uploadImageData(
          "Products/Images", thumbNail, product.thumbNail.toString());
      product.thumbNail = url;

      if (product.images != null && product.images!.isNotEmpty) {
        List<String> imagesUrl = [];
        for (var image in product.images!) {
          final assetImage = await storage.getImageDataFromAsset(image);
          final url = await storage.uploadImageData(
              "Products/Images", assetImage, image);

          imagesUrl.add(url);
        }
        product.images!.clear();
        product.images!.addAll(imagesUrl);
      }

      if (product.productType == ProductType.variable.toString()) {
        for (var variation in product.productVariations!) {
          final assetImage =
              await storage.getImageDataFromAsset(variation.image);
          final url = await storage.uploadImageData(
              "Products/Images", assetImage, variation.image.toString());
          variation.image = url;
        }
      }

      await _db.collection("Products").doc(product.id).set(product.toJson());
    }
  }

  //get featured produucts
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapShot = await _db
          .collection("Products")
          .where("IsFeatured", isEqualTo: true)
          .limit(6)
          .get();
      return snapShot.docs.map((e) => ProductModel.fromSnapShot(e)).toList();
    } catch (e) {
      throw "Ops";
    }
  }

  //get All produucts
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final snapShot = await _db
          .collection("Products")
          .where("IsFeatured", isEqualTo: true)
          .get();
      return snapShot.docs.map((e) => ProductModel.fromSnapShot(e)).toList();
    } catch (e) {
      throw "Ops";
    }
  }

  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapShot(doc))
          .toList();
      return productList;
    } catch (e) {
      throw 'Error';
    }
  }

  Future<List<ProductModel>> getProdcutsForBrand(
      {required String brandId, int limit = -1}) async {
    try {
      final querySnapShot = limit == -1
          ? await _db
              .collection("Products")
              .where("Brand.Id", isEqualTo: brandId)
              .get()
          : await _db
              .collection("Products")
              .where("Brand.Id", isEqualTo: brandId)
              .limit(limit)
              .get();
      final products = querySnapShot.docs
          .map((prodcut) => ProductModel.fromQuerySnapShot(prodcut))
          .toList();
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
      throw "Error";
    }
  }

  Future<List<ProductModel>> getProductsForCatagory(
      {required catagoryId, int limit = 4}) async {
    try {
      final productCatagoryQuery = limit == -1
          ? await _db
              .collection("ProductCatagory")
              .where("catagoryId", isEqualTo: catagoryId)
              .get()
          : await _db
              .collection("ProductCatagory")
              .where("catagoryId", isEqualTo: catagoryId)
              .limit(limit)
              .get();
      List<String> productIds = productCatagoryQuery.docs
          .map((e) => e["productId"] as String)
          .toList();
      final productQuery = await _db
          .collection("Products")
          .where(FieldPath.documentId, whereIn: productIds)
          .get();
      List<ProductModel> products =
          productQuery.docs.map((e) => ProductModel.fromSnapShot(e)).toList();
      return products;
    } catch (e) {
      throw "Error";
    }
  }

  Future<List<ProductModel>> getFavouritesProducts(
      List<String> productIds) async {
    try {
      if (productIds.isEmpty) return [];
      final snapshot = await _db
          .collection("Products")
          .where(FieldPath.documentId, whereIn: productIds)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapShot(e)).toList();
    } catch (e) {
      throw "Error";
    }
  }
}
