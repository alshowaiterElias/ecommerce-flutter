import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:football_app/data/services/firebase_storage_service.dart';
import 'package:football_app/features/pitch/models/catagory_model.dart';
import 'package:get/get.dart';

class CatagoryRepo extends GetxController {
  static CatagoryRepo get instance => Get.find();

  //variables
  final _db = FirebaseFirestore.instance;

  //Get all Catagories
  Future<List<CatagoryModel>> getAllCatagories() async {
    try {
      final snapShot = await _db.collection("Catagories").get();
      final list = snapShot.docs
          .map((document) => CatagoryModel.fromSnapShot(document))
          .toList();
      return list;
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  //Get sub catagories
  Future<List<CatagoryModel>> getSubCatagories(String catagoryId) async {
    try {
      final snapshot = await _db
          .collection("Catagories")
          .where("ParentId", isEqualTo: catagoryId)
          .get();
      final result =
          snapshot.docs.map((e) => CatagoryModel.fromSnapShot(e)).toList();
      return result;
    } catch (e) {
      throw "Error";
    }
  }

  //upload catagories
  Future<void> uploadDummyData(List<CatagoryModel> catagories) async {
    //upload catagory with their images
    final storage = Get.put(FirebaseStorageService());

    //loop through catagories
    for (var catagory in catagories) {
      final file = await storage.getImageDataFromAsset(catagory.image);
      final url =
          await storage.uploadImageData("Catagories", file, catagory.name);
      catagory.image = url;
      await _db
          .collection("Catagories")
          .doc(catagory.id)
          .set(catagory.toJson());
    }
  }
}
