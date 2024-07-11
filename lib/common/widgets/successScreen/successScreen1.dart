import 'package:flutter/material.dart';
import 'package:football_app/common/styles/spacing_styles.dart';

import 'package:football_app/utils/constants/sizes.dart';
import 'package:football_app/utils/constants/text_strings.dart';
import 'package:football_app/utils/helpers/helper.dart';

class Successscreen1 extends StatelessWidget {
  const Successscreen1(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.onPressed});

  final String image, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppbarHeight * 2,
          child: Column(
            children: [
              Image(
                image: AssetImage(image),
                width: THelperFunctions.screenWidth(context) * 0.6,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              //Title SubTitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(subtitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      onPressed();
                    },
                    child: const Text(TTextStrings.tcontinue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
