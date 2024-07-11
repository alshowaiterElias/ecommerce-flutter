import 'package:flutter/material.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:football_app/utils/helpers/helper.dart';

class TSectionHeader extends StatelessWidget {
  const TSectionHeader({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = "View All",
    this.onPressd,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressd;

  @override
  Widget build(BuildContext context) {
    final bool isDark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(
              onPressed: onPressd,
              child: Text(
                buttonTitle,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: isDark ? TColors.white : TColors.balck),
              ))
      ],
    );
  }
}
