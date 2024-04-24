import 'package:financial_management/base/base_mixin_model.dart';
import 'package:financial_management/core/color.dart';
import 'package:financial_management/helper/navigator_helper.dart';
import 'package:financial_management/helper/number_helper.dart';
import 'package:financial_management/pages/analytics/analytics_page_model.dart';
import 'package:financial_management/pages/budget/constants.dart';
import 'package:financial_management/router/router_config.dart';
import 'package:financial_management/widgets/budget_chart/double_column_chart.dart';
import 'package:financial_management/widgets/button/row_select.dart';
import 'package:financial_management/widgets/button/tab_button.dart';
import 'package:financial_management/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:remixicon/remixicon.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> with MixinModel<AnalyticPageModel>, SingleTickerProviderStateMixin {
  AnalyticPageModel pageModel = AnalyticPageModel();

  @override
  AnalyticPageModel withModel() {
    return pageModel;
  }

  
  @override
  Widget build(BuildContext context) {
    return present(context);
  }

  @override
  Function(BuildContext context, AnalyticPageModel model, Widget? child)
      withBuilder() {
    return (BuildContext context, AnalyticPageModel model, Widget? child) {
      return ModalProgressHUD(
        inAsyncCall: pageModel.busy,
        progressIndicator: const LoadingWidget(),
        child: buildBody(context),
      );
    };
  }



  @override
  void initState() {
    super.initState();
    pageModel.initData(context);
  }

  
  Widget buildBody(BuildContext context) {
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
                            ' ${NumberHelper.formatMoney(pageModel.totalInOut.income)}',
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
                          const SizedBox(
                            width: 6,
                          ),
                          Container(
                              margin: const EdgeInsets.only(bottom: 3),
                              child: const Text('Thu'))
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
                            ' ${NumberHelper.formatMoney(pageModel.totalInOut.spent.abs())}',
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
                          const SizedBox(
                            width: 6,
                          ),
                          Container(
                              margin: const EdgeInsets.only(bottom: 3),
                              child: const Text('Chi'))
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              DoubleColumnChart(
                  chartData: pageModel.chartData),
              const SizedBox(
                height: 48,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            navigatorHelper.changeView(
                                context, RouteNames.budgetAnalytics,
                                params: {'type': '$TRANSACTION_TYPE_INCOME'});
                          },
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
                              title: 'Chi tiết khoản thu',
                              icon: Remix.bank_card_fill,
                              color: appColors.green,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            navigatorHelper.changeView(
                                context, RouteNames.budgetAnalytics,
                                params: {'type': '$TRANSACTION_TYPE_SPENT'});
                          },
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
                        // OpenContainer(
                        //   transitionType: ContainerTransitionType.fade,
                        //   transitionDuration: Duration(milliseconds: 500),
                        //   openBuilder: (context, _) => BudgetAnalyticsPage(),
                        //   closedBuilder: (context, VoidCallback openContainer) =>
                        //       GestureDetector(
                        //     behavior: HitTestBehavior.translucent,
                        //     onTap: openContainer,
                        //     child: Container(
                        //       padding: const EdgeInsets.all(16),
                        //       decoration: BoxDecoration(
                        //         boxShadow: [
                        //           BoxShadow(
                        //             color: Colors.grey.withOpacity(
                        //                 0.2), // Màu và độ trong suốt của shadow
                        //             spreadRadius: 2, // Độ lan rộng của shadow
                        //             blurRadius: 5, // Độ mờ của shadow
                        //             offset: const Offset(
                        //                 0, 3), // Độ dịch chuyển của shadow (x, y)
                        //           ),
                        //         ],
                        //         color: Colors.white,
                        //         borderRadius: BorderRadius.circular(20),
                        //       ),
                        //       child: RowSelectWidget(
                        //         title: 'Chi tiết khoản chi',
                        //         icon: Remix.exchange_fill,
                        //         color: appColors.strongOrange,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
