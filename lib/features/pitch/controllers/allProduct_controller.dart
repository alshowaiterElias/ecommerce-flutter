import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:football_app/data/repos/product.dart';
import 'package:football_app/features/pitch/models/product_model.dart';
import 'package:football_app/utils/loaders/loaders.dart';
import 'package:get/get.dart';

class AllProductController extends GetxController {
  static AllProductController get intance => Get.find();

  final productRepo = ProductRepo.instance;
  final RxString selectedOption = "Name".obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try {
      if (query == null) return [];
      final products = await productRepo.fetchProductsByQuery(query);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
      return [];
    }
  }

  void sortProducts(String sortOption) {
    selectedOption.value = sortOption;
    switch (sortOption) {
      case "Name":
        products.sort(
          (a, b) => a.title.compareTo(b.title),
        );
        break;
      case "Higher Prices":
        products.sort(
          (a, b) => b.price.compareTo(a.price),
        );
        break;
      case "Lower Prices":
        products.sort(
          (a, b) => a.price.compareTo(b.price),
        );
        break;
      case "Newest":
        products.sort(
          (a, b) => a.date!.compareTo(b.date!),
        );
        break;
      case "Sale":
        products.sort(
          (a, b) {
            if (b.salePrice > 0) {
              return b.salePrice.compareTo(a.salePrice);
            } else if (a.salePrice > 0) {
              return -1;
            } else {
              return 1;
            }
          },
        );
        break;

      default:
        products.sort(
          (a, b) => a.title.compareTo(b.title),
        );
        break;
    }
  }

  void assignProducts(List<ProductModel> products) {
    this.products.assignAll(products);
    sortProducts("Name");
  }
}
