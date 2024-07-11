import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/loginSignUp/dividerForm.dart';
import 'package:football_app/common/widgets/loginSignUp/socialMedia.dart';
import 'package:football_app/features/authentication/views/signup/widgets/signupForm.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/constants/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //title
              Text(TTextStrings.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              //Form
              const SignupForm(),

              //Footer
              const SizedBox(height: TSizes.spaceBtwSections),
              const TFormDivider(dividerText: TTextStrings.orSignWith),
              const SizedBox(height: TSizes.spaceBtwItems),

              const SocialMedia(),
            ],
          ),
        ),
      ),
    );
  }
}
