import 'package:financial_management/core/color.dart';
import 'package:flutter/material.dart';

class FMCheckBox extends StatelessWidget {
  final String text;
  final bool value;
  final void Function(bool?)? onChange;
  final IconData? icon;
  const FMCheckBox({
    super.key,
    required this.text,
    this.value = false,
    required this.onChange,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            activeColor: AppColors.purple, value: value, onChanged: onChange),
        Text(text)
      ],
    );
  }
}
