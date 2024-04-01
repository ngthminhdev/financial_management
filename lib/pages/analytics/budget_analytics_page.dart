import 'package:financial_management/core/color.dart';
import 'package:financial_management/widgets/category_spent_chart/category_spent_chart.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class BudgetAnalyticsPage extends StatefulWidget {
  const BudgetAnalyticsPage({super.key});

  @override
  State<BudgetAnalyticsPage> createState() => _BudgetAnalyticsPageState();
}

class _BudgetAnalyticsPageState extends State<BudgetAnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: appColors.bg,
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "Chi tiết danh mục",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: appColors.darkPurple),
                  ),
                ]),
                const SizedBox(
                  height: 32,
                ),
                CategorySpendChart(),
                const SizedBox(
                  height: 16,
                ),
                const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Remix.time_line),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Lịch sử",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
