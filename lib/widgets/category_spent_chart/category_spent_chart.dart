import 'package:auto_size_text/auto_size_text.dart';
import 'package:financial_management/core/color.dart';
import 'package:financial_management/helper/number_helper.dart';
import 'package:financial_management/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CategorySpendChart extends StatelessWidget {
  const CategorySpendChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> chartData = [
      CategoryModel(
          id: '1', name: 'Nhà cửa', icon: 1, status: 1, amountUsed: 1726385),
      CategoryModel(
          id: '2',
          name: 'Đồ đi chợ nấu ăn',
          icon: 2,
          status: 1,
          amountUsed: 827460),
      CategoryModel(
          id: '3',
          name: 'Các bữa ăn uống bên ngoài',
          icon: 3,
          status: 1,
          amountUsed: 322450),
      CategoryModel(
          id: '4',
          name: 'Uống các thứ (cafe, trà sữa..)',
          icon: 4,
          status: 1,
          amountUsed: 250120),
    ];

    return Container(
      // height: 800,
      // width: 1000,
      // color: appColors.lightPurple,
      padding: EdgeInsets.only(bottom: 10),
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
        child: SfCircularChart(
          annotations: <CircularChartAnnotation>[
            CircularChartAnnotation(
              widget: PhysicalModel(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
                elevation: 0,
                color: appColors.orange,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  width: 100,
                  height: 30,
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    '\$ ${NumberHelper.formatMoney(11346000)}',
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
              innerRadius: '85%',
              radius: '70%',
              xValueMapper: (CategoryModel data, _) => data.name,
              yValueMapper: (CategoryModel data, _) => data.amountUsed,
              dataLabelMapper: (CategoryModel data, _) =>
                  NumberHelper.formatMoney(data.amountUsed!),
              pointColorMapper: (CategoryModel data, _) => data.color,
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                overflowMode: OverflowMode.shift,
                labelPosition: ChartDataLabelPosition.outside,
                // builder: (dynamic data, dynamic point, dynamic series,
                //     int pointIndex, int seriesIndex) {
                //   return Container(
                //     constraints: BoxConstraints(
                //       maxWidth: 100,
                //       maxHeight: 40,
                //     ),
                //     padding: EdgeInsets.all(8.0),
                //     decoration: BoxDecoration(
                //       color: data.color,
                //       borderRadius: BorderRadius.circular(20.0),
                //       boxShadow: [
                //         BoxShadow(
                //           color: Colors.grey.withOpacity(0.3),
                //           spreadRadius: 1,
                //           blurRadius: 2,
                //           offset: Offset(0, 2),
                //         ),
                //       ],
                //     ),
                //     child: Row(
                //       children: [
                //         Container(
                //           width: 25,
                //           height: 25,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(50),
                //             color: Colors.white,
                //           ),
                //           child: Icon(
                //             Remix.wallet_fill,
                //             size: 13,
                //           ),
                //         ),
                //         Container(
                //           width: 50,
                //           child: AutoSizeText(
                //             ' ${NumberHelper.formatMoney(data.amountUsed)}',
                //             overflow: TextOverflow.ellipsis,
                //             style: TextStyle(
                //               // color: Colors.black,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   );
                // },
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
            isResponsive: true,
            overflowMode: LegendItemOverflowMode.wrap,
            orientation: LegendItemOrientation.vertical,
            alignment: ChartAlignment.near,
            position: LegendPosition.bottom, // Vị trí của hướng dẫn (phải)
            textStyle: TextStyle(
                fontSize: 13), // Phông chữ của văn bản trong hướng dẫn
          ),
        ),
      ),
    );
  }
}
