import 'package:financial_management/core/color.dart';
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
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FMTabButton(
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
              Expanded(
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
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
                          title: 'Ngân sách mặc định',
                          icon: Ionicons.wallet,
                          color: appColors.strongYellow,
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Container(
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
                          title: 'Tiết kiệm',
                          icon: Remix.hand_coin_fill,
                          color: appColors.mediumPurple,
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Container(
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
                          title: 'Đầu tư',
                          icon: Remix.funds_fill,
                          color: appColors.strongOrange,
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
