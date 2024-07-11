import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/layout/gridLayout.dart';
import 'package:football_app/common/widgets/shimmer/shimmer_effect.dart';

class TBrandsShimmer extends StatelessWidget {
  const TBrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      mainAxiesExtent: 80,
      itemCount: itemCount,
      itemBuilder: (p0, p1) => const TShimmerEffect(width: 300, height: 80),
    );
  }
}
