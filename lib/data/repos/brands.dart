import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:football_app/data/services/firebase_storage_service.dart';
import 'package:football_app/features/pitch/models/brand_model.dart';
import 'package:get/get.dart';

class BrandsRepo extends GetxController {
  static BrandsRepo get instance => Get.find();

  //variables
  final _db = FirebaseFirestore.instance;

  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapShot = await _db.collection("Brands").get();
      final result =
          snapShot.docs.map((brand) => BrandModel.fromSnapShot(brand)).toList();
      return result;
    } catch (e) {
      throw "Error";
    }
  }

  Future<void> uploadDummyData(List<BrandModel> brands) async {
    try {
      final storage = Get.put(FirebaseStorageService());

      for (var brand in brands) {
        final file = await storage.getImageDataFromAsset(brand.image);
        final url = await storage.uploadImageData("Brands", file, brand.name);
        brand.image = url;
        await _db.collection("Brands").doc(brand.id).set(brand.toJson());
      }
    } catch (e) {
      throw "Error";
    }
  }

  Future<List<BrandModel>> getBrandsForCatagory(String catagoryId) async {
    try {
      QuerySnapshot brandCatagoryQuery = await _db
          .collection("BrandCatagory")
          .where("catagoryId", isEqualTo: catagoryId)
          .get();
      List<String> brandIds = brandCatagoryQuery.docs
          .map((doc) => doc['brandId'] as String)
          .toList();
      final brandsQuery = await _db
          .collection("Brands")
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(2)
          .get();

      List<BrandModel> brands =
          brandsQuery.docs.map((doc) => BrandModel.fromSnapShot(doc)).toList();
      return brands;
    } catch (e) {
      throw "Error";
    }
  }
}
