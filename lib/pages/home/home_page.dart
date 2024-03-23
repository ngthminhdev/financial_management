import 'package:financial_management/core/color.dart';
import 'package:financial_management/pages/home/widgets/advice_widget.dart';
import 'package:financial_management/pages/home/widgets/budget_widget.dart';
import 'package:financial_management/pages/home/widgets/expenses_widget.dart';
import 'package:financial_management/pages/home/widgets/goal_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            // color: appColors.bg,
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                // const EdgeInsets.all(20),
            child: Column(
            mainAxisSize: MainAxisSize.max,
           //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Ngân sách và Chi phí",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Tất cả",
                          style: TextStyle(
                            color: appColors.mediumPurple,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ]),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BudgetWidget(),
                    ExpensesWidget(),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Mục tiêu của bạn",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Tất cả",
                          style: TextStyle(
                            color: appColors.mediumPurple,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ]),
                const SizedBox(
                  height: 8,
                ),
                GoalWidget(),
                // const SizedBox(
                //   height: 16,
                // ),
                // AdviceWidget(),
              ],
            )),
      ),
    );
  }
}
