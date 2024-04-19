import 'package:financial_management/base/base_mixin_model.dart';
import 'package:financial_management/constant/app_constant.dart';
import 'package:financial_management/core/color.dart';
import 'package:financial_management/helper/date_helper.dart';
import 'package:financial_management/helper/number_helper.dart';
import 'package:financial_management/pages/analytics/budget_analytics/budget_analytics_page_model.dart';
import 'package:financial_management/widgets/budget_chart/category_icon_widget.dart';
import 'package:financial_management/widgets/category_spent_chart/category_spent_chart.dart';
import 'package:financial_management/widgets/loading/category_icon_sketch.dart';
import 'package:financial_management/widgets/loading/line_sketch.dart';
import 'package:financial_management/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:remixicon/remixicon.dart';

class BudgetAnalyticsPage extends StatefulWidget {
  Map<String, String>? params;
  BudgetAnalyticsPage({super.key, required this.params});

  @override
  State<BudgetAnalyticsPage> createState() => _BudgetAnalyticsPageState();
}

class _BudgetAnalyticsPageState extends State<BudgetAnalyticsPage>
    with MixinModel<BudgetAnalyticPageModel>, SingleTickerProviderStateMixin {
  BudgetAnalyticPageModel pageModel = BudgetAnalyticPageModel();

  @override
  BudgetAnalyticPageModel withModel() {
    return pageModel;
  }

  @override
  Widget build(BuildContext context) {
    return present(context);
  }

  @override
  Function(BuildContext context, BudgetAnalyticPageModel model, Widget? child)
      withBuilder() {
    return (BuildContext context, BudgetAnalyticPageModel model,
        Widget? child) {
      return ModalProgressHUD(
        inAsyncCall: pageModel.busy,
        progressIndicator: const LoadingWidget(),
        child: buildBody(context),
      );
    };
  }

  @override
  void initState() {
    pageModel.initData(context, widget.params!['type']!);
    super.initState();
  }

  Widget buildBody(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: appColors.bg,
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  pageModel.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: appColors.darkPurple),
                ),
              ]),
              const SizedBox(
                height: 16,
              ),
              CategorySpendChart(
                chartData: pageModel.chartData,
                total: pageModel.totalSpent,
              ),
              const SizedBox( 
                height: 22,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Remix.time_line,
                      color: appColors.darkCharcoal,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Lịch sử",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: appColors.darkCharcoal,
                      ),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      pageModel.sortListTransaction();
                    },
                    icon: Icon(
                        pageModel.isDesc ? Remix.sort_desc : Remix.sort_asc))
              ]),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                // height: MediaQuery.of(context).size.height * 0.,
                child: pageModel.listTransactions.isEmpty
                    ? buildListTransactionsSketch()
                    : buildListTransactions(),
              )
            ],
          ),
        ),
      ),
    );
  }

  ListView buildListTransactionsSketch() {
    return ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CategoryIconSketch(
                          (MediaQuery.of(context).size.width * 0.43 - 30) * 0.3,
                          40),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          LineSketch(150, 16),
                          const SizedBox(
                            height: 5,
                          ),
                          LineSketch(100, 14),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          LineSketch(90, 16),
                          const SizedBox(
                            height: 5,
                          ),
                          LineSketch(70, 14),
                        ],
                      ),
                    ],
                  )
                ]),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            thickness: 1,
            color: appColors.grey,
          );
        });
  }

  ListView buildListTransactions() {
    return ListView.separated(
        itemCount: pageModel.listTransactions.length,
        itemBuilder: (context, index) {
          final transaction = pageModel.listTransactions[index];
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CategoryIconWidget(
                        icon: appConstant.categoryIconMap[transaction.icon]!,
                        color: appColors.lightPink,
                        iconColor: appColors.darkCharcoal,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            transaction.categoryName!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: appColors.darkCharcoal,
                            ),
                          ),
                          Text(
                            transaction.note!,
                            style: TextStyle(
                              fontSize: 14,
                              // fontWeight: FontWeight.bold,
                              color: appColors.darkCharcoal,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            DateHelper.format(transaction.date!),
                            style: TextStyle(
                              color: appColors.charcoal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                NumberHelper.formatMoney(transaction.amount!),
                                style: TextStyle(
                                  color: pageModel.textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ]),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            thickness: 1,
            color: appColors.grey,
          );
        });
  }
}
