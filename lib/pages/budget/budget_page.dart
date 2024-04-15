import 'package:financial_management/constant/app_constant.dart';
import 'package:financial_management/core/color.dart';
import 'package:financial_management/helper/date_helper.dart';
import 'package:financial_management/pages/budget/budget_page_model.dart';
import 'package:financial_management/widgets/budget_chart/category_icon_widget.dart';
import 'package:financial_management/widgets/button/button_constant.dart';
import 'package:financial_management/widgets/button/row_select.dart';
import 'package:financial_management/widgets/popups/select_popup_widget.dart';
import 'package:financial_management/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  late BudgetPageModel pageModel;

  @override
  void initState() {
    super.initState();
    pageModel = BudgetPageModel(context);
    pageModel.initData();
  }

  @override
  void dispose() {
    super.dispose();
    pageModel.amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: pageModel.dialogKey,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
          },
          child: Container(
            color: appColors.bg,
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
            // const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "Thêm giao dịch",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: appColors.darkPurple),
                  ),
                ]),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FMTabButton(
                      tabTitles: const ["Thu", "Chi"],
                      onTabChange: (int tab) {
                        setState(() {
                          pageModel.setTransactionType(tab);
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      // padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      width: 150,
                      child: TextField(
                        controller: pageModel.amountController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.end,
                        decoration: const InputDecoration(
                          enabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          errorBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          focusedErrorBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'Số tiền...',
                          hintStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (amount) {
                          print(
                              'File: lib/pages/budget/budget_page.dart - Line: 105: $amount ');
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: appColors.grey),
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        "VNĐ",
                        style: TextStyle(
                          color: appColors.charcoal,
                          fontSize: 28,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  // constraints: BoxConstraints(
                  //   minHeight: 200,
                  // ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(
                            0.2), // Màu và độ trong suốt của shadow
                        spreadRadius: 2, // Độ lan rộng của shadow
                        blurRadius: 5, // Độ mờ của shadow
                        offset: const Offset(
                            0, 3), // Độ dịch chuyển của shadow (x, y)
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          appPopup.selectPopup(context,
                              title: Text("Chọn loại ngân sách",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: appColors.darkPurple)),
                              callback: (dynamic value) {
                            print('value ::: $value');
                          }, items: appConstant.budgetSelects);
                        },
                        child: RowSelectWidget(
                          icon: Remix.price_tag_3_fill,
                          title: "Ngân sách",
                          showValue: true,
                          value: "Mặc định",
                          color: appColors.strongYellow,
                        ),
                      ),
                      Divider(thickness: 1, color: appColors.grey),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          appPopup.selectPopup(context,
                              title: Text("Chọn loại danh mục",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: appColors.darkPurple)),
                              callback: (dynamic categoryId) {
                            setState(() {
                              pageModel.setSelectedCategory(categoryId);
                            });
                          }, items: pageModel.listCategories);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                CategoryIconWidget(
                                    icon: Remix.dashboard_fill,
                                    color: appColors.purple),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text("Danh mục",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: appColors.charcoal)),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                    pageModel.selectedCategory != null
                                        ? pageModel.selectedCategory!.name
                                        : "Chọn danh mục",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: appColors.charcoal)),
                                const SizedBox(
                                  width: 5,
                                ),
                                Icon(Remix.arrow_right_s_line,
                                    color: appColors.charcoal)
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(thickness: 1, color: appColors.grey),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          appPopup.dateTimePickerPopup(
                            context,
                            title: Text("Chọn thời gian",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: appColors.darkPurple)),
                            callback: (dynamic value) {
                              setState(() {
                                pageModel.setSelectedDate(value);
                              });
                            },
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                CategoryIconWidget(
                                    icon: Remix.calendar_schedule_fill,
                                    color: appColors.orange),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text("Thời gian",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: appColors.charcoal)),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                    DateHelper.format(
                                      pageModel.selectedDate.toString(),
                                    ),
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: appColors.charcoal)),
                                const SizedBox(
                                  width: 5,
                                ),
                                Icon(Remix.arrow_right_s_line,
                                    color: appColors.charcoal)
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(thickness: 1, color: appColors.grey),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          appPopup.textAreaPopup(
                            context,
                            title: Text("Chỉnh sửa ghi chú",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: appColors.darkPurple)),
                            callback: (String? value) {
                              setState(() {
                                pageModel.setNote(value);
                              });
                            },
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                CategoryIconWidget(
                                    icon: Remix.file_edit_fill,
                                    color: appColors.green),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text("Ghi chú",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: appColors.charcoal)),
                              ],
                            ),
                            Row(
                              children: [
                                Text(pageModel.note ?? "Thêm ghi chú...",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: appColors.charcoal)),
                                const SizedBox(
                                  width: 5,
                                ),
                                Icon(Remix.arrow_right_s_line,
                                    color: appColors.charcoal)
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                // Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                // children: [
                // Text("Cài đặt thông báo",
                // style: TextStyle(
                // fontSize: 22,
                // fontWeight: FontWeight.bold,
                // color: appColors.charcoal)),
                // ],
                // ),
                FMButton(
                  text: "Lưu",
                  size: FMButtonSize.max,
                  onPressed: () {
                    setState(() {
                      pageModel.createTransaction();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
