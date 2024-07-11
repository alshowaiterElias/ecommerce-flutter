import 'package:flutter/material.dart';
import 'package:football_app/features/authentication/controllers/signupController.dart';
import 'package:football_app/utils/validiators/validiator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.put(SignupController());
    final bool isDark = THelperFunctions.isDarkMode(context);
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    validator: (value) =>
                        TValidiator.validateEmptyText("First name", value),
                    controller: controller.firstname,
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTextStrings.firstname,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    validator: (value) =>
                        TValidiator.validateEmptyText("Last name", value),
                    controller: controller.lastname,
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTextStrings.lastname,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              validator: (value) =>
                  TValidiator.validateEmptyText("Username", value),
              controller: controller.username,
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTextStrings.username,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              validator: (value) => TValidiator.validiateEmail(value),
              controller: controller.email,
              expands: false,
              decoration: const InputDecoration(
                labelText: TTextStrings.email,
                prefixIcon: Icon(Iconsax.direct),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            Obx(
              () => TextFormField(
                validator: (value) => TValidiator.validatePassword(value),
                controller: controller.password,
                expands: false,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: TTextStrings.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.hidePassword.value =
                          !controller.hidePassword.value;
                    },
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  ),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              validator: (value) => TValidiator.validatePhoneNumber(value),
              controller: controller.phoneNumber,
              expands: false,
              decoration: const InputDecoration(
                labelText: TTextStrings.phone,
                prefixIcon: Icon(Iconsax.call),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            const SizedBox(height: TSizes.spaceBtwSections),
            //Terms and Privacy
            Row(
              children: [
                SizedBox(
                    width: 24,
                    height: 24,
                    child: Obx(() => Checkbox(
                        value: controller.tickCheckBox.value,
                        onChanged: (value) {
                          controller.tickCheckBox.value =
                              !controller.tickCheckBox.value;
                        }))),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: '${TTextStrings.iAgreeTo} ',
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: '${TTextStrings.privacyPolicy} ',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color:
                                isDark ? TColors.white : TColors.primaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor:
                                isDark ? TColors.white : TColors.primaryColor,
                          )),
                  TextSpan(
                      text: '${TTextStrings.and} ',
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: '${TTextStrings.termsOfUse} ',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color:
                                isDark ? TColors.white : TColors.primaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor:
                                isDark ? TColors.white : TColors.primaryColor,
                          )),
                ]))
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.signUp();
                },
                child: const Text(TTextStrings.createAccount),
              ),
            )
          ],
        ));
  }
}
