import 'package:auto_size_text/auto_size_text.dart';
import 'package:financial_management/core/color.dart';
import 'package:financial_management/helper/number_helper.dart';
import 'package:financial_management/widgets/budget_chart/category_icon_widget.dart';
import 'package:flutter/material.dart';

class CategoryCardWidget extends StatelessWidget {
  final IconData icon;
  // final Color color;
  final String name;
  final double amountUsed;
  const CategoryCardWidget({
    super.key,
    required this.icon,
    // required this.color,
    required this.name,
    required this.amountUsed,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width * 0.43 - 30,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CategoryIconWidget(icon: icon),
          Container(
              width: (MediaQuery.of(context).size.width * 0.43 - 30) * 0.65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  AutoSizeText(
                    "${NumberHelper.formatMoney(amountUsed)}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.strongOrange,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

