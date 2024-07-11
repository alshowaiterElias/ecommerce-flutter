import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/cart/payment_tile.dart';
import 'package:football_app/common/widgets/texts/sectionHeader.dart';
import 'package:football_app/features/pitch/models/payment_method_model.dart';
import 'package:football_app/utils/constants/image_strings.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();
  Rx<PaymentMethodModel> selectedPayment = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPayment.value =
        PaymentMethodModel(image: TImageStrings.google3, name: "Paypal");
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(TSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TSectionHeader(
                title: "Select payment method",
                showActionButton: false,
                onPressd: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              TPaymentTile(
                  payment: PaymentMethodModel(
                      image: TImageStrings.google3, name: "Paypal")),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              TPaymentTile(
                  payment: PaymentMethodModel(
                      image: TImageStrings.google3, name: "Kuraimi")),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              TPaymentTile(
                  payment: PaymentMethodModel(
                      image: TImageStrings.google3, name: "OneCash")),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              TPaymentTile(
                  payment: PaymentMethodModel(
                      image: TImageStrings.google3, name: "Master Card")),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
            ],
          ),
        ),
      ),
    );
  }
}
