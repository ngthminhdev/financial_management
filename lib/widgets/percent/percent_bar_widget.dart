import 'package:financial_management/core/color.dart';
import 'package:financial_management/helper/number_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PercentBar extends StatelessWidget {
  final double target;
  final double current;
  const PercentBar({required this.target, this.current = 0, super.key});

  double getCurrentPercentWidth(double width) {
    double percent = (current / target) * 100;
    return width - (width / 100 * percent);
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width - 70;
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "\$ ${NumberHelper.formatMoney(current)}",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.green),
              ),
              Text(
                " / \$ ${NumberHelper.formatMoney(target)}",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.charcoal),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    width: width,
                    child: Divider(
                      thickness: 8,
                      color: AppColors.grey,
                    ),
                  ),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    width: width,
                    child: Divider(
                      endIndent: getCurrentPercentWidth(width),
                      thickness: 8,
                      color: AppColors.green,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
