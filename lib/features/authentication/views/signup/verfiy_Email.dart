import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_app/data/repos/authentication.dart';
import 'package:football_app/features/authentication/controllers/verfiy_email_controller.dart';
import 'package:football_app/utils/constants/image_strings.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/constants/text_strings.dart';
import 'package:football_app/utils/helpers/helper.dart';
import 'package:get/get.dart';

class VerfiyEmail extends StatelessWidget {
  const VerfiyEmail({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final VerfiyEmailController controller = Get.put(VerfiyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                AuthenticationRepo.instance.logout();
              },
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //IMAGE
              Image(
                image: const AssetImage(TImageStrings.onBoarrdingImage1),
                width: THelperFunctions.screenWidth(context) * 0.6,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              //Title SubTitle
              Text(
                TTextStrings.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                email ?? "",
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(TTextStrings.confirmEmailSubtitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              //Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      controller.checkEmailVerificationStatus();
                    },
                    child: const Text(TTextStrings.tcontinue)),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {
                      controller.sendEmailVerification();
                    },
                    child: const Text(TTextStrings.resendEmail)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
