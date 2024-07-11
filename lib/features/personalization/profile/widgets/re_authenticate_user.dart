import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/appbar/appbar.dart';
import 'package:football_app/features/personalization/controllers/user_controller.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/validiators/validiator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthenticateUser extends StatelessWidget {
  const ReAuthenticateUser({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppbar(
        title: Text("Re-Authenticate User"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
              key: controller.deleteUserFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.verfiyEmail,
                    validator: (value) => TValidiator.validiateEmail(value),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.arrow_right),
                      labelText: "Email",
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),
                  Obx(
                    () => TextFormField(
                      obscureText: controller.hidePassword.value,
                      controller: controller.verfiyPassword,
                      validator: (value) => TValidiator.validatePassword(value),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.hidePassword.value =
                                  !controller.hidePassword.value;
                            },
                            icon: Icon(controller.hidePassword.value
                                ? Iconsax.eye_slash
                                : Iconsax.eye)),
                        labelText: "Password",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          controller.reAuthenticateEmailAndPassowrdThenDelete();
                        },
                        child: const Text("Confirm")),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
