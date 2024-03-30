import 'package:financial_management/core/color.dart';
import 'package:financial_management/widgets/budget_chart/category_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class RowSelectWidget extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final String? value;
  final bool showValue;
  final bool showArrow;
  final String title;

  const RowSelectWidget({
    super.key,
    required this.title,
    required this.icon,
    this.color,
    this.showValue = false,
    this.showArrow = true,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            CategoryIconWidget(icon: icon, color: color),
            const SizedBox(
              width: 10,
            ),
            Text(title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: appColors.charcoal)),
          ],
        ),
        Row(
          children: [
            if (showValue == true && value != null)
              Text(value!,
              overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: appColors.charcoal)),
            const SizedBox(
              width: 5,
            ),
            if (showArrow) Icon(Remix.arrow_right_s_line, color: appColors.charcoal)
          ],
        )
      ],
    );
  }
}
