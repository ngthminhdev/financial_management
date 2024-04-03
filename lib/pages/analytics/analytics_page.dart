import 'package:animations/animations.dart';
import 'package:financial_management/core/color.dart';
import 'package:financial_management/helper/number_helper.dart';
import 'package:financial_management/pages/analytics/budget_analytics_page.dart';
import 'package:financial_management/widgets/budget_chart/double_column_chart.dart';
import 'package:financial_management/widgets/button/row_select.dart';
import 'package:financial_management/widgets/button/tab_button.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:remixicon/remixicon.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  "Phân tích chi tiêu",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: appColors.darkPurple),
                ),
              ]),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FMTabButton(
                    initialIndex: 1,
                    tabTitles: const ['Ngày', 'Tháng', 'Năm'],
                    onTabChange: (int tab) {
                      print(
                          'File: lib/pages/budget/budget_page.dart - Line: 42: $tab ');
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Remix.arrow_down_circle_fill,
                            color: appColors.green,
                            size: 20,
                          ),
                          Text(
                            ' ${NumberHelper.formatMoney(13150000)}',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: appColors.green),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Remix.git_commit_fill,
                            color: appColors.green,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Container(
                              margin: EdgeInsets.only(bottom: 3),
                              child: Text('Thu'))
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Remix.arrow_up_circle_fill,
                            color: appColors.strongOrange,
                            size: 20,
                          ),
                          Text(
                            ' ${NumberHelper.formatMoney(8150000)}',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: appColors.strongOrange),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Remix.git_commit_fill,
                            color: appColors.strongOrange,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Container(
                              margin: EdgeInsets.only(bottom: 3),
                              child: Text('Chi'))
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              DoubleColumnChart(),
              const SizedBox(
                height: 48,
              ),
              Expanded(
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OpenContainer(
                        transitionType: ContainerTransitionType.fade,
                        transitionDuration: Duration(milliseconds: 500),
                        openBuilder: (context, _) => BudgetAnalyticsPage(),
                        closedBuilder: (context, VoidCallback openContainer) =>
                            GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          // onTap: openContainer,
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(
                                      0.2), // Màu và độ trong suốt của shadow
                                  spreadRadius: 2, // Độ lan rộng của shadow
                                  blurRadius: 5, // Độ mờ của shadow
                                  offset: const Offset(
                                      0, 3), // Độ dịch chuyển của shadow (x, y)
                                ),
                              ],
                              color: Colors.white,
                            ),
                            child: RowSelectWidget(
                              title: 'Chi tiết khoản thu',
                              icon: Remix.bank_card_fill,
                              color: appColors.green,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      OpenContainer(
                        transitionType: ContainerTransitionType.fade,
                        transitionDuration: Duration(milliseconds: 500),
                        openBuilder: (context, _) => BudgetAnalyticsPage(),
                        closedBuilder: (context, VoidCallback openContainer) =>
                            GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: openContainer,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(
                                      0.2), // Màu và độ trong suốt của shadow
                                  spreadRadius: 2, // Độ lan rộng của shadow
                                  blurRadius: 5, // Độ mờ của shadow
                                  offset: const Offset(
                                      0, 3), // Độ dịch chuyển của shadow (x, y)
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: RowSelectWidget(
                              title: 'Chi tiết khoản chi',
                              icon: Remix.exchange_fill,
                              color: appColors.strongOrange,
                            ),
                          ),
                        ),
                      ),
                 ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
