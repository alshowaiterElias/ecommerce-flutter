import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/Reservations/reservationCardsVertical.dart';
import 'package:football_app/common/widgets/layout/gridLayout.dart';
import 'package:football_app/features/pitch/controllers/allProduct_controller.dart';
import 'package:football_app/features/pitch/models/product_model.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    final contoller = Get.put(AllProductController());
    contoller.assignProducts(products);
    return Column(
      children: [
        //Drop Down Menu
        DropdownButtonFormField(
          value: contoller.selectedOption.value,
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items: [
            "Name",
            "Higher Prices",
            "Lower Prices",
            "Sale",
            "Newest",
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
          onChanged: (value) {
            contoller.sortProducts(value!);
          },
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        //all products
        Obx(
          () => TGridLayout(
            itemCount: contoller.products.length,
            itemBuilder: (_, index) {
              return TReservationsVertical(
                product: contoller.products[index],
              );
            },
          ),
        )
      ],
    );
  }
}
