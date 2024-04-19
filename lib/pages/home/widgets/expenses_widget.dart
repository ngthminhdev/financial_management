import 'package:auto_size_text/auto_size_text.dart';
import 'package:financial_management/widgets/cards/category_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class ExpensesWidget extends StatefulWidget {
  const ExpensesWidget({super.key});

  @override
  State<ExpensesWidget> createState() => _ExpensesWidgetState();
}

class _ExpensesWidgetState extends State<ExpensesWidget> {
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Chi phí",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.43 - 30,
            height: MediaQuery.of(context).size.height * 0.23,
            child: const Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategoryCardWidget(
                    icon: Remix.motorbike_fill,
                    name: 'Xe cộ',
                    amountUsed: 2322150),
                CategoryCardWidget(
                    icon: Remix.restaurant_fill,
                    name: 'Thực phẩm',
                    amountUsed: 1090240),
                CategoryCardWidget(
                    icon: Remix.drinks_2_fill,
                    name: 'Giải khát',
                    amountUsed: 540320),
              ],
            ),
          ),
          const AutoSizeText(
            "+11 chi phí khác",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
