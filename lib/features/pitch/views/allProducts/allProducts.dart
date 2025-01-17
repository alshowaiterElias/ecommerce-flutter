import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/appbar/appbar.dart';
import 'package:football_app/common/widgets/pitches/sortableProducts.dart';
import 'package:football_app/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:football_app/features/pitch/controllers/allProduct_controller.dart';
import 'package:football_app/features/pitch/models/product_model.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:get/get.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen(
      {super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    return Scaffold(
      appBar: TAppbar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {
                const loader = TVerticalProductShimmer();
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return loader;
                }
                if (!snapshot.hasData ||
                    snapshot.data == null ||
                    snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text("No data found"),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Something went wrong"),
                  );
                }

                final products = snapshot.data!;

                return TSortableProducts(
                  products: products,
                );
              }),
        ),
      ),
    );
  }
}
