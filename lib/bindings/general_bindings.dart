import 'package:football_app/features/personalization/controllers/address_controller.dart';
import 'package:football_app/features/pitch/controllers/checkout_controller.dart';

import 'package:football_app/features/pitch/controllers/variation_controller.dart';
import 'package:football_app/utils/network/networkManager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckoutController());
  }
}
