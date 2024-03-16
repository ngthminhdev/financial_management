import 'package:auto_size_text/auto_size_text.dart';
import 'package:financial_management/core/color.dart';
import 'package:financial_management/helper/date_helper.dart';
import 'package:financial_management/widgets/budget_chart/category_icon_widget.dart';
import 'package:financial_management/widgets/button/button_constant.dart';
import 'package:financial_management/widgets/percent/percent_bar_widget.dart';
import 'package:financial_management/widgets/percent/percent_icon_widget.dart';
import 'package:financial_management/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class AdviceWidget extends StatefulWidget {
  const AdviceWidget({super.key});

  @override
  State<AdviceWidget> createState() => _AdviceWidgetState();
}

class _AdviceWidgetState extends State<AdviceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.115,
      ),
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.purple,
          width: 1,
        ),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: AutoSizeText(
          '“Những đồng tiền giống như những nô lệ – nếu không theo dõi, chúng sẽ đi khỏi”',
          maxLines: 3,
          minFontSize: 14,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
