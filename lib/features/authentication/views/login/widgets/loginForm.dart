import 'package:flutter/material.dart';
import 'package:football_app/features/authentication/controllers/login_controllers.dart';
import 'package:football_app/features/authentication/views/password_config/forgetPassword.dart';
import 'package:football_app/features/authentication/views/signup/signup.dart';
import 'package:football_app/utils/validiators/validiator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
                validator: (value) => TValidiator.validiateEmail(value),
                controller: controller.email,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTextStrings.email,
                )),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            Obx(
              () => TextFormField(
                  obscureText: controller.hidePassword.value,
                  validator: (value) =>
                      TValidiator.validateEmptyText("Passwrod", value),
                  controller: controller.password,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      labelText: TTextStrings.password,
                      suffixIcon: IconButton(
                          onPressed: () {
                            controller.hidePassword.value =
                                !controller.hidePassword.value;
                          },
                          icon: Icon(controller.hidePassword.value
                              ? Iconsax.eye_slash
                              : Iconsax.eye)))),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields / 2,
            ),
            // Remember Me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //remember me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) {
                            controller.rememberMe.value =
                                !controller.rememberMe.value;
                          }),
                    ),
                    const Text(TTextStrings.rememberMe),
                  ],
                ),
                //forgot password
                TextButton(
                  onPressed: () {
                    Get.to(() => const Forgetpassword());
                  },
                  child: const Text(TTextStrings.forgotPassword),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            //Sign in Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    controller.emailAndPasswordSignIn();
                  },
                  child: const Text(TTextStrings.signIn)),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            //Create an account
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {
                    Get.to(() => const SignUpScreen());
                  },
                  child: const Text(TTextStrings.createAccount)),
            ),
          ],
        ),
      ),
    );
  }
}
