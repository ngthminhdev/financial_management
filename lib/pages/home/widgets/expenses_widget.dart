import 'package:auto_size_text/auto_size_text.dart';
import 'package:financial_management/constant/app_constant.dart';
import 'package:financial_management/model/category_model.dart';
import 'package:financial_management/widgets/cards/category_card_widget.dart';
import 'package:financial_management/widgets/loading/category_icon_sketch.dart';
import 'package:financial_management/widgets/loading/line_sketch.dart';
import 'package:flutter/material.dart';

class ExpensesWidget extends StatefulWidget {
  List<CategoryModel> listExpensive = [];
  ExpensesWidget(this.listExpensive, {super.key});

  @override
  State<ExpensesWidget> createState() => _ExpensesWidgetState();
}

class _ExpensesWidgetState extends State<ExpensesWidget> {
  @override
  Widget build(BuildContext context) {
    int otherCategory = widget.listExpensive.length - 4 > 0
        ? widget.listExpensive.length - 3
        : 0;
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
          SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.43 - 30,
              height: MediaQuery.of(context).size.height * 0.23,
              child: ListView.separated(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    if (widget.listExpensive.isEmpty) {
                      return Row(
                        children: [
                          CategoryIconSketch(
                              (MediaQuery.of(context).size.width * 0.43 - 30) *
                                  0.3,
                              40),
                          const SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              LineSketch(90, 16),
                              const SizedBox(
                                height: 5,
                              ),
                              LineSketch(70, 14),
                            ],
                          )
                        ],
                      );
                    }
                    final CategoryModel category = widget.listExpensive[index];
                    return CategoryCardWidget(
                        icon: appConstant.categoryIconMap[category.icon]!,
                        name: category.name,
                        amountUsed: category.amountUsed!);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 16,
                    );
                  }),
            ),
          ),
          widget.listExpensive.isEmpty
              ? LineSketch(110, 16)
              : AutoSizeText(
                  "+$otherCategory chi phí khác",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ],
      ),
    );
  }
}
