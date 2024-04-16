import 'package:financial_management/constant/app_constant.dart';
import 'package:financial_management/core/color.dart';
import 'package:financial_management/helper/date_helper.dart';
import 'package:financial_management/helper/number_helper.dart';
import 'package:financial_management/pages/analytics/budget_analytics_page_model.dart';
import 'package:financial_management/widgets/budget_chart/category_icon_widget.dart';
import 'package:financial_management/widgets/category_spent_chart/category_spent_chart.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class BudgetAnalyticsPage extends StatefulWidget {
  const BudgetAnalyticsPage({super.key});

  @override
  State<BudgetAnalyticsPage> createState() => _BudgetAnalyticsPageState();
}

class _BudgetAnalyticsPageState extends State<BudgetAnalyticsPage> {
  late BudgetAnalyticPageModel pageModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageModel = BudgetAnalyticPageModel(context);
    pageModel.initData();
  }

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
                  "Chi tiết khoản chi",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: appColors.darkPurple),
                ),
              ]),
              const SizedBox(
                height: 32,
              ),
              const CategorySpendChart(),
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
                IconButton(onPressed: () {}, icon: const Icon(Remix.sort_asc))
              ]),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                // height: MediaQuery.of(context).size.height * 0.,
                child: FutureBuilder(
                    // future: null,
                    builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  // List<TransactionHistoryModel>? list = snapshot.data as dynamic;
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
                                      icon: appConstant
                                          .categoryIconMap[transaction.icon]!,
                                      color: appColors.lightPink,
                                      iconColor: appColors.darkCharcoal,
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          DateHelper.format(
                                              transaction.date!),
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
                                                color: appColors.strongOrange,
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
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
