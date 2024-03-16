import 'package:financial_management/core/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';

class CategoryIconWidget extends StatelessWidget {
  final IconData icon;
  final Color? color;
  const CategoryIconWidget({required this.icon, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    final String hex = RandomColor.getColor(
        Options(format: Format.hex, luminosity: Luminosity.bright));
    final Color randomColor = HexColor.fromHex(hex);
    final Color finalColor = color ?? randomColor;
    return Container(
      width: (MediaQuery.of(context).size.width * 0.43 - 30) * 0.3,
      decoration: BoxDecoration(
        color: finalColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Icon(
          icon,
          color: Colors.white,
          fill: 1,
        ),
      ),
    );
  }
}
