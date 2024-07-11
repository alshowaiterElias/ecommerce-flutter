import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/successScreen/successScreen1.dart';
import 'package:football_app/data/repos/authentication.dart';
import 'package:football_app/data/repos/order.dart';
import 'package:football_app/features/personalization/controllers/address_controller.dart';
import 'package:football_app/features/pitch/controllers/cart_controller.dart';
import 'package:football_app/features/pitch/controllers/checkout_controller.dart';
import 'package:football_app/features/pitch/models/order_model.dart';
import 'package:football_app/nav.dart';
import 'package:football_app/utils/constants/enums.dart';
import 'package:football_app/utils/constants/image_strings.dart';
import 'package:football_app/utils/loaders/loaders.dart';
import 'package:football_app/utils/popups/fullScreenLoader.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final cartController = CartController.instance;
  final addressController = AddressController.intance;
  final checkoutController = CheckoutController.instance;
  final orderRepo = Get.put(OrderRepo());

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepo.fetchUserOrders();
      return userOrders;
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap");
      return [];
    }
  }

  void processOrder(int totalPrice) async {
    try {
      FullScreenLoader.openLoadingDialog(
          "Processing", TImageStrings.docerAnimation);

      final userId = AuthenticationRepo.instance.authUser!.uid;
      if (userId.isEmpty) return;

      final order = OrderModel(
          id: UniqueKey().toString(),
          status: OrderStatus.processing,
          totalAmount: totalPrice.toDouble(),
          orderDate: DateTime.now(),
          deliveryDate: DateTime.now(),
          paymentMethod: checkoutController.selectedPayment.value.name,
          userId: userId,
          address: addressController.selectedAddress.value,
          items: cartController.cartItems.toList());

      await orderRepo.saveOrder(order, userId);

      cartController.clearCart();

      Get.off(() => Successscreen1(
          image: TImageStrings.onBoarrdingImage2,
          title: "Payment Sucscess",
          subtitle: "Your items will be shipped soon",
          onPressed: () {
            Get.offAll(() => const NavigationMenu());
          }));
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap");
    }
  }
}
