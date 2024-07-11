import 'package:football_app/data/repos/brands.dart';
import 'package:football_app/data/repos/product.dart';
import 'package:football_app/features/pitch/models/brand_model.dart';
import 'package:football_app/features/pitch/models/product_model.dart';
import 'package:football_app/utils/loaders/loaders.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandsRepo = Get.put(BrandsRepo());
  final isLoading = false.obs;

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  //load brands
  Future<void> getFeaturedBrands() async {
    try {
      isLoading.value = true;
      final brands = await brandsRepo.getAllBrands();
      allBrands.assignAll(brands);
      featuredBrands.assignAll(
          brands.where((brand) => brand.isFeatured ?? false).take(4));
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh snap", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //get brands for catagory
  Future<List<BrandModel>> getBrandsForCatagory(String catagoryId) async {
    try {
      final brands = await brandsRepo.getBrandsForCatagory(catagoryId);
      return brands;
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap");
      return [];
    }
  }

  //get brand specific products
  Future<List<ProductModel>> getBrandProducts(
      {required String brandId, int limit = -1}) async {
    try {
      final products = await ProductRepo.instance
          .getProdcutsForBrand(brandId: brandId, limit: limit);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
      return [];
    }
  }
}
