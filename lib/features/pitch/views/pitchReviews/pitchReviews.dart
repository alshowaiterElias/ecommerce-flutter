import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/appbar/appbar.dart';
import 'package:football_app/common/widgets/pitches/ratings/ratingBarIndicator.dart';
import 'package:football_app/features/pitch/views/pitchReviews/Widgets/overallRating.dart';
import 'package:football_app/features/pitch/views/pitchReviews/Widgets/userReviewCard.dart';
import 'package:football_app/utils/constants/sizes.dart';

class PitchReviews extends StatelessWidget {
  const PitchReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const TAppbar(title: Text("Reviews & Ratings"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Ratings and reviews are verified and are from people who use the same type of device that you use"),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TOverAllRating(),
              TRatingBarIndicator(rating: 3.5),
              Text("11,900", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              //User Review
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
