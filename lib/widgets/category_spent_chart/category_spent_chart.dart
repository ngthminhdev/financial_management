import 'package:auto_size_text/auto_size_text.dart';
import 'package:financial_management/core/color.dart';
import 'package:financial_management/helper/number_helper.dart';
import 'package:financial_management/model/category_model.dart';
import 'package:financial_management/widgets/loading/line_sketch.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CategorySpendChart extends StatelessWidget {
  List<CategoryModel> chartData;
  double total = 0;
  CategorySpendChart({super.key, required this.chartData, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      // color: appColors.lightPurple,
      padding: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color:
                Colors.grey.withOpacity(0.2), // Màu và độ trong suốt của shadow
            spreadRadius: 2, // Độ lan rộng của shadow
            blurRadius: 5, // Độ mờ của shadow
            offset: const Offset(0, 3), // Độ dịch chuyển của shadow (x, y)
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: chartData.isEmpty ? buildChartSketch() : buildChart(),
      ),
    );
  }

  SfCircularChart buildChartSketch() {
    return SfCircularChart(
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          widget: PhysicalModel(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            elevation: 0,
            color: appColors.orange,
            child: LineSketch(100, 25),
          ),
        ),
      ],
      series: <CircularSeries>[
        DoughnutSeries<CategoryModel, String>(
          enableTooltip: true,
          cornerStyle: CornerStyle.bothCurve,
          dataSource: [
            CategoryModel(
                id: '1', name: 'Sketch 1', icon: 1, amountUsed: 1726385),
            CategoryModel(
                id: '2', name: 'Sketch 2', icon: 2, amountUsed: 827460),
            CategoryModel(
                id: '3', name: 'Sketch 3', icon: 3, amountUsed: 322450),
            CategoryModel(
                id: '4', name: 'Sketch 4', icon: 4, amountUsed: 250120),
            CategoryModel(
                id: '5', name: 'Sketch 5', icon: 4, amountUsed: 250120),
            CategoryModel(
                id: '6', name: 'Sketch 6', icon: 4, amountUsed: 250120),
          ],
          animationDuration: 0,
          innerRadius: '85%',
          radius: '70%',
          xValueMapper: (CategoryModel data, _) => '....................',
          yValueMapper: (CategoryModel data, _) => data.amountUsed,
          dataLabelMapper: (CategoryModel data, _) =>
              // data.name,
              NumberHelper.formatMoney(-data.amountUsed!),
          pointColorMapper: (CategoryModel data, _) => appColors.grey,
          dataLabelSettings: DataLabelSettings(
            builder: (data, point, series, pointIndex, seriesIndex) {
              return LineSketch(50, 15);
            },
            isVisible: true,
            overflowMode: OverflowMode.shift,
            labelPosition: ChartDataLabelPosition.outside,
            labelIntersectAction: LabelIntersectAction.shift,
            labelAlignment: ChartDataLabelAlignment.outer,
            connectorLineSettings: const ConnectorLineSettings(
              type: ConnectorType.line, // Loại đường line
              width: 1.5, // Độ dày của đường line
            ),
          ),
        )
      ],
      legend: Legend(
        isVisible: true,
        isResponsive: false,
        padding: 5,
        overflowMode: LegendItemOverflowMode.wrap,
        orientation: LegendItemOrientation.vertical,
        alignment: ChartAlignment.near,
        position: LegendPosition.bottom,
        width: '200%',
        textStyle: const TextStyle(overflow: TextOverflow.fade, fontSize: 13),
      ),
    );
  }

  SfCircularChart buildChart() {
    return SfCircularChart(
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          widget: PhysicalModel(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            elevation: 0,
            color: appColors.orange,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              width: 100,
              height: 30,
              alignment: Alignment.center,
              child: AutoSizeText(
                '\$ ${NumberHelper.formatMoney(-total)}',
                maxLines: 1,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: appColors.white),
              ),
            ),
          ),
        ),
      ],
      series: <CircularSeries>[
        DoughnutSeries<CategoryModel, String>(
          enableTooltip: true,
          cornerStyle: CornerStyle.bothCurve,
          dataSource: chartData,
          animationDuration: 0,
          innerRadius: '85%',
          radius: '70%',
          xValueMapper: (CategoryModel data, _) => data.name,
          yValueMapper: (CategoryModel data, _) => data.amountUsed,
          dataLabelMapper: (CategoryModel data, _) =>
              // data.name,
              NumberHelper.formatMoney(-data.amountUsed!),
          pointColorMapper: (CategoryModel data, _) => data.color,
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
            overflowMode: OverflowMode.shift,
            labelPosition: ChartDataLabelPosition.outside,
            labelIntersectAction: LabelIntersectAction.shift,
            labelAlignment: ChartDataLabelAlignment.outer,
            connectorLineSettings: ConnectorLineSettings(
              type: ConnectorType.line, // Loại đường line
              width: 1.5, // Độ dày của đường line
            ),
          ),
        )
      ],
      legend: Legend(
        isVisible: true,
        isResponsive: false,
        padding: 5,
        overflowMode: LegendItemOverflowMode.wrap,
        orientation: LegendItemOrientation.vertical,
        alignment: ChartAlignment.near,
        position: LegendPosition.bottom,
        width: '200%',
        textStyle: const TextStyle(overflow: TextOverflow.fade, fontSize: 13),
      ),
    );
  }
}
