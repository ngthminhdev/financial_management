import 'package:financial_management/helper/date_helper.dart';
import 'package:financial_management/helper/number_helper.dart';
import 'package:financial_management/widgets/budget_chart/budget_chart.dart';
import 'package:flutter/material.dart';

class BudgetWidget extends StatefulWidget {
  const BudgetWidget({super.key});

  @override
  State<BudgetWidget> createState() => _BudgetWidgetState();
}

class _BudgetWidgetState extends State<BudgetWidget> {
  String currentMonth = DateHelper.getCurrentMonthYear();
  double totalBudget = 13135000;

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
      child: Column(
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
            currentMonth,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "\$ ${NumberHelper.formatMoney(totalBudget)}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Colors.black,
            ),
          ),
          SizedBox(
            // color: Colors.red,
            width: MediaQuery.of(context).size.width * 0.43 - 30,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BudgetChart(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
