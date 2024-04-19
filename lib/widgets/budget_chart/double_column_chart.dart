import 'package:financial_management/core/color.dart';
import 'package:financial_management/model/transaction_history_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoubleColumnChart extends StatelessWidget {
  List<TransactionHistoryModel> chartData;
  DoubleColumnChart({super.key, required this.chartData});

  double getChartWidth(int numOfColumns, double screenWidth) {
    if (numOfColumns <= 5) {
      return screenWidth;
    }
    double eachColumnWidth = screenWidth / 15;
    double extraWidth = eachColumnWidth * (numOfColumns - 5);
    return screenWidth + extraWidth;
  }

  @override
  Widget build(BuildContext context) {
    double originWidth = MediaQuery.of(context).size.width - 40;

    return Column(
      children: [
        SizedBox(
          width: getChartWidth(chartData.length, originWidth),
          height: 300,
          child: ListView(
            // shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 2,
                child: SfCartesianChart(
                  primaryXAxis: DateTimeAxis(
                    dateFormat: DateFormat(
                      DateFormat.ABBR_MONTH_DAY,
                    ),
                  ),
                  primaryYAxis: NumericAxis(
                    autoScrollingMode: AutoScrollingMode.start,
                    numberFormat: NumberFormat.compact(),
                  ),
                  series: [
                    ColumnSeries<TransactionHistoryModel, DateTime>(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                      dataSource: chartData,
                      xValueMapper: (TransactionHistoryModel data, _) =>
                          DateTime.parse(data.date!).toLocal(),
                      yValueMapper: (TransactionHistoryModel data, _) =>
                          data.income,
                      color: appColors.green,
                      name: 'Thu',
                    ),
                    ColumnSeries<TransactionHistoryModel, DateTime>(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                      dataSource: chartData,
                      xValueMapper: (TransactionHistoryModel data, _) =>
                          DateTime.parse(data.date!).toLocal(),
                      yValueMapper: (TransactionHistoryModel data, _) =>
                          data.spent!.abs(),
                      color: appColors.strongOrange,
                      name: 'Chi',
                    )
                  ],
                  tooltipBehavior: TooltipBehavior(
                    enable: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
