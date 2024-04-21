import 'package:financial_management/base/base_mixin_model.dart';
import 'package:financial_management/core/color.dart';
import 'package:financial_management/pages/home/home_page_model.dart';
import 'package:financial_management/pages/home/widgets/budget_widget.dart';
import 'package:financial_management/pages/home/widgets/expenses_widget.dart';
import 'package:financial_management/pages/home/widgets/goal_widget.dart';
import 'package:financial_management/widgets/loading/line_sketch.dart';
import 'package:financial_management/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with MixinModel<HomePageModel>, SingleTickerProviderStateMixin {
  HomePageModel pageModel = HomePageModel();

  @override
  HomePageModel withModel() {
    return pageModel;
  }

  @override
  Widget build(BuildContext context) {
    return present(context);
  }

  @override
  Function(BuildContext context, HomePageModel model, Widget? child)
      withBuilder() {
    return (BuildContext context, HomePageModel model, Widget? child) {
      return ModalProgressHUD(
        inAsyncCall: pageModel.busy,
        progressIndicator: const LoadingWidget(),
        child: buildBody(context),
      );
    };
  }

  @override
  void initState() {
    super.initState();
    pageModel.initData(context);
  }

  Widget buildBody(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            // color: appColors.bg,
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
            // const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      pageModel.user == null 
                      ? LineSketch(200, 17) 
                      : Text(
                        "Chào mừng ${pageModel.user!.username}!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      )
                      ,
                      // TextButton(
                      //   onPressed: () {},
                      //   child: Text(
                      //     "Tất cả",
                      //     style: TextStyle(
                      //       color: appColors.mediumPurple,
                      //       fontSize: 16,
                      //     ),
                      //   ),
                      // ),
                    ]),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BudgetWidget(pageModel.wallet),
                    ExpensesWidget(pageModel.listExpensive),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Mục tiêu của bạn",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Tất cả",
                          style: TextStyle(
                            color: appColors.mediumPurple,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ]),
                const SizedBox(
                  height: 8,
                ),
                const GoalWidget(),
                // const SizedBox(
                //   height: 16,
                // ),
                // AdviceWidget(),
              ],
            )),
      ),
    );
  }
}
