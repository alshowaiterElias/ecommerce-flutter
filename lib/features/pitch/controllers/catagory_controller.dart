import 'package:football_app/data/repos/catagory.dart';
import 'package:football_app/data/repos/product.dart';
import 'package:football_app/features/pitch/models/catagory_model.dart';
import 'package:football_app/features/pitch/models/product_model.dart';
import 'package:football_app/utils/loaders/loaders.dart';
import 'package:get/get.dart';

class CatagoryController extends GetxController {
  static CatagoryController get instance => Get.find();
  final _catagoryRepo = Get.put(CatagoryRepo());
  final RxList<CatagoryModel> allCatagories = <CatagoryModel>[].obs;
  final RxList<CatagoryModel> featuredCatagories = <CatagoryModel>[].obs;

  final isLoading = false.obs;
  @override
  void onInit() {
    fetchCatagories();
    super.onInit();
  }

  //load catagory data
  Future<void> fetchCatagories() async {
    try {
      //show loader
      isLoading.value = true;
      //fetch from data source
      final catagories = await _catagoryRepo.getAllCatagories();
      //update the catagory list
      allCatagories.assignAll(catagories);
      //filter featured catagory
      featuredCatagories.assignAll(allCatagories
          .where((catagory) => catagory.isFeatured && catagory.parentId.isEmpty)
          .take(8));
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    } finally {
      //remove loader
      isLoading.value = false;
    }
  }

  //load selected catagory data
  Future<List<CatagoryModel>> getSubCatagories(String catagoryId) async {
    try {
      final subCatagories = await _catagoryRepo.getSubCatagories(catagoryId);
      return subCatagories;
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap");
      return [];
    }
  }

  //get catagory or subcatagory products
  Future<List<ProductModel>> getCatagoryProduct(
      {required String catagoryId, int limit = 4}) async {
    final products = await ProductRepo.instance
        .getProductsForCatagory(catagoryId: catagoryId, limit: limit);
    return products;
  }
}
