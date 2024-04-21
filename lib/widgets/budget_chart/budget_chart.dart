import 'package:financial_management/core/color.dart';
import 'package:financial_management/model/wallet_model.dart';
import 'package:financial_management/widgets/loading/line_sketch.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BudgetChart extends StatelessWidget {
  WalletModel? wallet;
  // List<ChartData> chartData = [];
  BudgetChart(this.wallet);

  @override
  Widget build(BuildContext context) {
    List<ChartData> chartData = [
      ChartData('Balance', wallet != null ? wallet!.balance! : 0),
      ChartData('Spent', wallet != null ? wallet!.spent! : 0),
    ];
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.33,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Center(
          child: wallet != null
              ? buildChart(chartData)
              : buildChartSketch(chartData)),
    );
  }

  SfCircularChart buildChart([List<ChartData>? chartData]) {
    return SfCircularChart(
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
          animationDuration: 0,
          dataLabelMapper: (ChartData data, _) => data.y.toString(),
          pointColorMapper: (ChartData data, _) =>
              data.x == 'Balance' ? appColors.green : appColors.strongOrange,
        )
      ],
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          widget: PhysicalModel(
            shape: BoxShape.circle,
            elevation: 0,
            color: Colors.white,
            child: Container(
                width: 80,
                height: 80,
                alignment: Alignment.center,
                child: Lottie.asset('assets/animation/cash_out.json',
                    width: 80, repeat: false)),
          ),
        ),
      ],
    );
  }

  SfCircularChart buildChartSketch([List<ChartData>? chartData]) {
    return SfCircularChart(
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
          animationDuration: 0,
          dataLabelMapper: (ChartData data, _) => data.y.toString(),
          pointColorMapper: (ChartData data, _) =>
              data.x == 'Balance' ? appColors.lightGrey : appColors.grey,
        )
      ],
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          widget: PhysicalModel(
            shape: BoxShape.circle,
            elevation: 0,
            color: Colors.white,
            child: Container(
                width: 80,
                height: 80,
                alignment: Alignment.center,
                child: LineSketch(30, 30)),
          ),
        ),
      ],
    );
  }
}

class ChartData {
  final String x;
  final double y;

  ChartData(this.x, this.y);
}
