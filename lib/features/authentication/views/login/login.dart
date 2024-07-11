import 'package:flutter/material.dart';
import 'package:football_app/common/styles/spacing_styles.dart';
import 'package:football_app/common/widgets/loginSignUp/dividerForm.dart';
import 'package:football_app/common/widgets/loginSignUp/socialMedia.dart';
import 'package:football_app/features/authentication/views/login/widgets/loginForm.dart';
import 'package:football_app/features/authentication/views/login/widgets/loginHeader.dart';
import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppbarHeight,
          child: Column(
            children: [
              //logo ,Title,SubTitle
              const SignInHeader(),

              //Form
              const SignInForm(),

              //Divider
              TFormDivider(
                dividerText: TTextStrings.orSignWith.capitalize!,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              //Footer
              const SocialMedia(),
            ],
          ),
        ),
      ),
    );
  }
}
