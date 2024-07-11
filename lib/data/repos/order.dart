import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:football_app/data/repos/authentication.dart';
import 'package:football_app/features/pitch/models/order_model.dart';
import 'package:get/get.dart';

class OrderRepo extends GetxController {
  static OrderRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userId = AuthenticationRepo.instance.authUser!.uid;
      if (userId.isEmpty) throw "Something went wrong";

      final result =
          await _db.collection("Users").doc(userId).collection("Orders").get();

      return result.docs.map((e) => OrderModel.fromSnapShot(e)).toList();
    } catch (e) {
      throw "Error";
    }
  }

  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      await _db
          .collection("Users")
          .doc(userId)
          .collection("Orders")
          .add(order.toJson());
    } catch (e) {
      throw "Error";
    }
  }
}
