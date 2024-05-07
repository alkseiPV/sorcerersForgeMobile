import 'package:flutter/material.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';

class StarDisplay extends StatelessWidget {
  final double value;
  final int starCount;
  final Color color;
  final double size;
  final int count;

  const StarDisplay({
    super.key,
    this.value = 0.0,
    this.starCount = 5,
    this.color = AppColors.activeColor,
    this.size = 24.0,
    this.count = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(starCount, (index) {
            return Icon(
              (index + 1) <= value ? Icons.star : Icons.star_border,
              color: color,
              size: size,
            );
          }),
        ),
        if (count != 0)
          Text(
            ' $count',
            style: AppText.priceText,
          )
      ],
    );
  }
}
