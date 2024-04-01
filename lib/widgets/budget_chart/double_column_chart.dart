import 'package:financial_management/core/color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoubleColumnChart extends StatelessWidget {
  const DoubleColumnChart({super.key});

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
    List<ChartData> chartData = [
      ChartData(date: DateTime(2024, 3, 1), income: 10000, spend: 5000),
      ChartData(date: DateTime(2024, 3, 2), income: 12000, spend: 8000),
      ChartData(date: DateTime(2024, 3, 3), income: 15000, spend: 7000),
      ChartData(date: DateTime(2024, 3, 4), income: 9000, spend: 6000),
      ChartData(date: DateTime(2024, 3, 5), income: 11000, spend: 4000),
      ChartData(date: DateTime(2024, 3, 6), income: 11000, spend: 4000),
      ChartData(date: DateTime(2024, 3, 7), income: 11000, spend: 4000),
      ChartData(date: DateTime(2024, 3, 8), income: 11000, spend: 4000),
      ChartData(date: DateTime(2024, 3, 9), income: 11000, spend: 4000),
      ChartData(date: DateTime(2024, 3, 10), income: 11000, spend: 4000),
      ChartData(date: DateTime(2024, 3, 11), income: 11000, spend: 4000),
    ];
    double originWidth = MediaQuery.of(context).size.width - 40;

    return Column(
      children: [
        Container(
          // decoration: BoxDecoration(
          //   boxShadow: [
          //     BoxShadow(
          //       color: Colors.grey
          //           .withOpacity(0.2), // Màu và độ trong suốt của shadow
          //       spreadRadius: 2, // Độ lan rộng của shadow
          //       blurRadius: 5, // Độ mờ của shadow
          //       offset: const Offset(0, 3), // Độ dịch chuyển của shadow (x, y)
          //     ),
          //   ],
          //   color: Colors.white,
          //   borderRadius: BorderRadius.circular(20),
          // ),
          // padding: EdgeInsets.only(left: 10),
          // color: appColors.lightPurple,

          width: getChartWidth(chartData.length, originWidth),
          height: 300,
          child: ListView(
            // shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                // width: getChartWidth(chartData.length, originWidth),
                width: MediaQuery.of(context).size.width * 2,
                child: SfCartesianChart(
                  // margin: EdgeInsets.only(right: 10),
                  // title: ChartTitle(
                  //     text: 'Biểu đồ thu chi (VNĐ)',
                  //     alignment: ChartAlignment.near,
                  //     textStyle: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         color: appColors.darkPurple)),
                  primaryXAxis: DateTimeAxis(
                    // title: AxisTitle(text: 'Ngày'),
                    dateFormat: DateFormat(
                      DateFormat.ABBR_MONTH_DAY,
                    ),
                  ),
                  primaryYAxis: NumericAxis(
                    autoScrollingMode: AutoScrollingMode.start,
                    // title: AxisTitle(text: 'Số tiền (VNĐ)'),
                    numberFormat: NumberFormat.compact(), // Định dạng thành k
                    // labelFormat: (value) => currencyFormatter.format(value),
                  ),

                  series: [
                    ColumnSeries<ChartData, DateTime>(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.date,
                      yValueMapper: (ChartData data, _) => data.income,
                      color: appColors.green,
                      name: 'Thu',
                    ),
                    ColumnSeries<ChartData, DateTime>(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.date,
                      yValueMapper: (ChartData data, _) => data.spend,
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

class ChartData {
  final DateTime date;
  final double income;
  final double spend;

  ChartData({required this.date, required this.income, required this.spend});
}
