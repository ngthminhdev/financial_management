import 'package:auto_size_text/auto_size_text.dart';
import 'package:financial_management/core/color.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:remixicon/remixicon.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BudgetChart extends StatelessWidget {
  final List<ChartData> chartData = [
    ChartData('Free', 8122545),
    ChartData('Spent', 4817262),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.33,
          height: MediaQuery.of(context).size.height * 0.15,
          child: Center(
              child: SfCircularChart(
            series: <CircularSeries>[
              DoughnutSeries<ChartData, String>(
                dataSource: chartData,
                cornerStyle: CornerStyle.bothCurve,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                innerRadius: '80%',
                radius: '100%',
                dataLabelSettings: const DataLabelSettings(
                  isVisible: false, // Ẩn label
                ),
                dataLabelMapper: (ChartData data, _) => data.y.toString(),
                pointColorMapper: (ChartData data, _) =>
                    data.x == 'Spent' ? appColors.green : appColors.strongOrange,
              )
            ],
            annotations: <CircularChartAnnotation>[
              CircularChartAnnotation(
                widget: PhysicalModel(
                  shape: BoxShape.circle,
                  elevation: 0,
                  color: Colors.white,
                  child: Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    child: Icon(
                      Remix.currency_fill,
                      color: appColors.strongYellow,
                      size: 32,
                      fill: 1,
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Symbols.do_not_disturb_on,
              size: 14,
              color: appColors.strongOrange,
            ),
            AutoSizeText(
              " 8,122,545 đ",
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: appColors.strongOrange,
              ),
            ),
            // Text(
            //   "Spent",
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 12,
            //     color: Colors.grey,
            //   ),
            // ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Symbols.add_circle,
              size: 14,
              color: Colors.green,
            ),
            AutoSizeText(
              " 4,817,262 đ ",
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: appColors.green,
              ),
            ),
            // Text(
            //   "Free",
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 12,
            //     color: Colors.grey,
            //   ),
            // ),
          ],
        )
      ],
    );
  }
}

class ChartData {
  final String x;
  final double y;

  ChartData(this.x, this.y);
}
