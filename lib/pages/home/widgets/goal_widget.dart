import 'package:animations/animations.dart';
import 'package:financial_management/core/color.dart';
import 'package:financial_management/helper/date_helper.dart';
import 'package:financial_management/pages/register/register_page.dart';
import 'package:financial_management/widgets/budget_chart/category_icon_widget.dart';
import 'package:financial_management/widgets/button/button_constant.dart';
import 'package:financial_management/widgets/percent/percent_bar_widget.dart';
import 'package:financial_management/widgets/percent/percent_icon_widget.dart';
import 'package:financial_management/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class GoalWidget extends StatefulWidget {
  const GoalWidget({super.key});

  @override
  State<GoalWidget> createState() => _GoalWidgetState();
}

class _GoalWidgetState extends State<GoalWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.25,
      ),
      width: MediaQuery.of(context).size.width - 40,
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width * 0.35,
                ),
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CategoryIconWidget(
                        icon: Remix.macbook_line,
                        color: appColors.strongOrange),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Macbook Pro",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              PercentIcon(
                percent: 10.7,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          PercentBar(
            target: 24000000,
            current: 2461000,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateHelper.format("2024-03-09T14:30:00"),
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: appColors.grey),
              ),
              Text(
                DateHelper.format("2025-03-09T14:30:00"),
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: appColors.grey),
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          OpenContainer(
            transitionType: ContainerTransitionType.fade,
            transitionDuration: Duration(milliseconds: 500),
            openBuilder: (context, _) => RegisterPage(),
            closedBuilder: (context, VoidCallback openContainer) => FMButton(
              text: "Thêm mục tiêu",
              type: FMButtonType.attention,
              size: FMButtonSize.max,
              icon: Container(
                margin: EdgeInsets.only(right: 5),
                child: Icon(
                  Remix.add_circle_fill,
                  size: 24,
                  color: Colors.white,
                ),
              ),
              onPressed: openContainer
            ),
          )
        ],
      ),
    );
  }
}
