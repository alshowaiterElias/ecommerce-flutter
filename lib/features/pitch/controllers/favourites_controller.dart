import 'dart:convert';

import 'package:football_app/data/repos/product.dart';
import 'package:football_app/features/pitch/models/product_model.dart';
import 'package:football_app/utils/loaders/loaders.dart';
import 'package:football_app/utils/local_storage/localStorage.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  //variable
  final favourites = <String, bool>{}.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initFavourites();
  }

  Future<void> initFavourites() async {
    final json = TLocalStorage.instance().readData('favourites');
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(storedFavourites.map(
        (key, value) => MapEntry(key, value as bool),
      ));
    }
  }

  bool isFavourites(String productId) {
    return favourites[productId] ?? false;
  }

  void toggleFavouritesProduct(String productId) {
    if (!favourites.containsKey(productId)) {
      favourites[productId] = true;
      saveFavouritesToStorage();
      TLoaders.customToast(message: "Product has been added to wishlist");
    } else {
      TLocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavouritesToStorage();
      favourites.refresh();
      TLoaders.customToast(message: "Product has been removed from wishlist");
    }
  }

  void saveFavouritesToStorage() {
    final encodedFavourites = json.encode(favourites);
    TLocalStorage.instance().saveData("favourites", encodedFavourites);
  }

  Future<List<ProductModel>> favouritesProducts() async {
    return await ProductRepo.instance
        .getFavouritesProducts(favourites.keys.toList());
  }
}
