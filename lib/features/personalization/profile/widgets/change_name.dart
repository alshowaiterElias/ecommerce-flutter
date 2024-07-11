import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/appbar/appbar.dart';
import 'package:football_app/features/personalization/controllers/update_name_controller.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/validiators/validiator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: TAppbar(
        title: Text(
          "Change Name",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "use real name for easy verfication. this appear on several pages",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Form(
                  key: controller.updateUserNameKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.firstname,
                        validator: (value) =>
                            TValidiator.validateEmptyText("First Name", value),
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: "First Name",
                            prefix: Icon(Iconsax.user)),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputFields,
                      ),
                      TextFormField(
                        controller: controller.lasttname,
                        validator: (value) =>
                            TValidiator.validateEmptyText("Last Name", value),
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: "Last Name", prefix: Icon(Iconsax.user)),
                      ),
                    ],
                  )),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      controller.updateUserName();
                    },
                    child: const Text("Save")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
