import 'package:flutter/material.dart';
import 'package:football_app/features/authentication/controllers/forgot_password.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/constants/text_strings.dart';
import 'package:football_app/utils/validiators/validiator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Heading
            Text(TTextStrings.forgotPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(TTextStrings.forgotPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center),
            const SizedBox(
              height: TSizes.spaceBtwSections * 2,
            ),
            //Text
            Form(
              key: controller.forgotPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: (value) => TValidiator.validiateEmail(value),
                decoration: const InputDecoration(
                    labelText: TTextStrings.email,
                    prefixIcon: Icon(Iconsax.direct_right)),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            //Buttons
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      controller.sendPasswordResetEmail();
                    },
                    child: const Text(TTextStrings.submit))),
          ],
        ),
      ),
    );
  }
}
