import 'package:financial_management/core/color.dart';
import 'package:flutter/material.dart';

class PercentIcon extends StatelessWidget {
  final double percent;
  const PercentIcon({required this.percent, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 5, 7, 5),
      decoration: BoxDecoration(
        color: appColors.green,
        // color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          "$percent%",
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}

