import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:football_app/features/personalization/models/address_model.dart';
import 'package:football_app/features/pitch/models/cart_item.dart';
import 'package:football_app/utils/constants/enums.dart';

class OrderModel {
  final String id;
  final String userId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final AddressModel? address;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;

  OrderModel({
    required this.id,
    this.userId = "",
    required this.status,
    required this.totalAmount,
    required this.orderDate,
    this.paymentMethod = "Paypal",
    this.address,
    this.deliveryDate,
    required this.items,
  });

  String get orderStatusText => status == OrderStatus.delivered
      ? "Delivered"
      : status == OrderStatus.shipped
          ? "Shippment on way"
          : "Processing";

  Map<String, dynamic> toJson() {
    return {
      "Id": id,
      "UserId": userId,
      "Status": status.toString(),
      "TotalAmount": totalAmount,
      "OrderDate": orderDate,
      "PaymentMethod": paymentMethod,
      "Address": address?.toJson(),
      "DeliveryDate": deliveryDate,
      "Items": items.map((e) => e.toJson()).toList()
    };
  }

  factory OrderModel.fromSnapShot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return OrderModel(
        id: data["Id"] as String,
        paymentMethod: data["PaymentMethod"] as String,
        userId: data["UserId"] as String,
        deliveryDate: data["DeliveryDate"] == null
            ? null
            : (data["OrderDate"] as Timestamp).toDate(),
        address: AddressModel.fromMap(data["Address"] as Map<String, dynamic>),
        status: OrderStatus.values
            .firstWhere((e) => e.toString() == data["Status"]),
        totalAmount: data["TotalAmount"] as double,
        orderDate: (data["OrderDate"] as Timestamp).toDate(),
        items: (data["Items"] as List<dynamic>)
            .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}
