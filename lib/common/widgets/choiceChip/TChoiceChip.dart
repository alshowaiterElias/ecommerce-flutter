import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/custom_shapes/Containers/circularContainer.dart';
import 'package:football_app/utils/constants/colors.dart';
import 'package:football_app/utils/helpers/helper.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getColor(text) != null;
    return ChoiceChip(
      label: isColor ? const SizedBox() : Text(text),
      labelStyle: TextStyle(color: selected ? TColors.white : null),
      selected: selected,
      onSelected: onSelected,
      avatar: isColor
          ? TCircularContainer(
              width: 50,
              height: 50,
              backgroundColor: THelperFunctions.getColor(text)!)
          : null,
      shape: isColor ? const CircleBorder() : null,
      labelPadding: isColor ? EdgeInsets.zero : null,
      backgroundColor: THelperFunctions.getColor(text),
      padding: isColor ? EdgeInsets.zero : null,
    );
  }
}
