import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/appbar/appbar.dart';
import 'package:football_app/features/personalization/controllers/address_controller.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/validiators/validiator.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.intance;
    return Scaffold(
      appBar:
          const TAppbar(showBackArrow: true, title: Text("Add new address")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) =>
                      TValidiator.validateEmptyText("Name", value),
                  controller: controller.name,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user), labelText: "Name"),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                  validator: (value) =>
                      TValidiator.validateEmptyText("Phone Number", value),
                  controller: controller.phoneNumber,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile),
                      labelText: "Phone Number"),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (value) =>
                            TValidiator.validateEmptyText("Street", value),
                        controller: controller.street,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.building_31),
                            labelText: "Street"),
                      ),
                    ),
                    const SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        validator: (value) => TValidiator.validateEmptyText(
                            "neighborhood", value),
                        controller: controller.neighborhood,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.code),
                            labelText: "neighborhood"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                    validator: (value) =>
                        TValidiator.validateEmptyText("City", value),
                    controller: controller.city,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.building), labelText: "City")),
                const SizedBox(height: TSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.addNewAddress();
                      },
                      child: const Text("Save")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
