import 'package:financial_management/core/color.dart';
import 'package:flutter/material.dart';

class CategoryIconWidget extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final Color? color;
  final double? width;
  final double? height;
  final double? iconSize;
  const CategoryIconWidget(
      {required this.icon,
      this.iconColor = Colors.white,
      this.color,
      this.width,
      this.height = 40,
      this.iconSize = 24,
      super.key});

  @override
  Widget build(BuildContext context) {
    final Color finalColor = color ?? AppColors.randomColor();
    return Container(
      width: width ?? (MediaQuery.of(context).size.width * 0.43 - 30) * 0.3,
      height: height,
      decoration: BoxDecoration(
        color: finalColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor,
          fill: 1,
        ),
      ),
    );
  }
}
