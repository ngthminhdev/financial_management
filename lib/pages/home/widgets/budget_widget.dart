import 'package:auto_size_text/auto_size_text.dart';
import 'package:financial_management/core/color.dart';
import 'package:financial_management/helper/date_helper.dart';
import 'package:financial_management/helper/number_helper.dart';
import 'package:financial_management/model/wallet_model.dart';
import 'package:financial_management/widgets/budget_chart/budget_chart.dart';
import 'package:financial_management/widgets/loading/line_sketch.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class BudgetWidget extends StatelessWidget {
  // String currentMonth = DateHelper.getCurrentMonthYear();
  // double totalBudget = 13135000;
  WalletModel? wallet;
  BudgetWidget(this.wallet);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width * 0.43,
      height: MediaQuery.of(context).size.height * 0.34,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color:
                Colors.grey.withOpacity(0.2), // Màu và độ trong suốt của shadow
            spreadRadius: 2, // Độ lan rộng của shadow
            blurRadius: 5, // Độ mờ của shadow
            offset: const Offset(0, 3), // Độ dịch chuyển của shadow (x, y)
          ),
        ],
      ),
      child: wallet != null ? buildBody(context) : buildBodySketch(context),
    );
  }

  Column buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Ngân sách",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        Text(
          DateHelper.getCurrentMonthYear(
              DateTime.parse(wallet!.date!).toLocal()),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          "\$ ${NumberHelper.formatMoney(wallet!.income!)}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Colors.black,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: MediaQuery.of(context).size.width * 0.43 - 30,
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BudgetChart(wallet),
                ],
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
                    " ${NumberHelper.formatMoney(wallet!.spent!.abs())}",
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: appColors.strongOrange,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Symbols.add_circle,
                    size: 14,
                    color: appColors.green,
                  ),
                  AutoSizeText(
                    " ${NumberHelper.formatMoney(wallet!.balance!)}",
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: appColors.green,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Column buildBodySketch(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LineSketch(70, 16),
        const SizedBox(height: 5),
        LineSketch(90, 14),
        const SizedBox(height: 5),
        LineSketch(130, 17),
        SizedBox(
          // color: Colors.red,
          width: MediaQuery.of(context).size.width * 0.43 - 30,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BudgetChart(null),
                ],
              ),
              const SizedBox(height: 10),
              LineSketch(130, 16),
              const SizedBox(height: 5),
              LineSketch(130, 16),
            ],
          ),
        )
      ],
    );
  }
}
