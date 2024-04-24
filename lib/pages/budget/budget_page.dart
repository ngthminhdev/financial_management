import 'package:financial_management/base/base_mixin_model.dart';
import 'package:financial_management/core/color.dart';
import 'package:financial_management/helper/date_helper.dart';
import 'package:financial_management/pages/budget/budget_page_model.dart';
import 'package:financial_management/pages/budget/constants.dart';
import 'package:financial_management/widgets/budget_chart/category_icon_widget.dart';
import 'package:financial_management/widgets/button/button_constant.dart';
import 'package:financial_management/widgets/button/row_select.dart';
import 'package:financial_management/widgets/loading/loading_widget.dart';
import 'package:financial_management/widgets/popups/app_popup.dart';
import 'package:financial_management/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:remixicon/remixicon.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage>
    with MixinModel<BudgetPageModel>, SingleTickerProviderStateMixin {
  BudgetPageModel pageModel = BudgetPageModel();

  @override
  BudgetPageModel withModel() {
    return pageModel;
  }

  @override
  Widget build(BuildContext context) {
    return present(context);
  }

  @override
  Function(BuildContext context, BudgetPageModel model, Widget? child)
      withBuilder() {
    return (BuildContext context, BudgetPageModel model, Widget? child) {
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

  @override
  void dispose() {
    super.dispose();
    pageModel.amountController.dispose();
  }

  Widget buildBody(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
            pageModel.setSelectedSection(null);
          },
          child: SingleChildScrollView(
            child: Container(
              color: appColors.bg,
              height: MediaQuery.of(context).size.height * 0.9,
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 20, top: 20),
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
                        tabTitles: const ["Chi", "Thu"],
                        onTabChange: (int tab) {
                          pageModel.setTransactionType(tab);
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
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            hintText: 'Số tiền...',
                            hintStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          // onChanged: (amount) {
                          //   print(
                          //       'File: lib/pages/budget/budget_page.dart - Line: 105: $amount ');
                          // },
                        ),
                      ),
                      const SizedBox(width: 10),
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
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
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
                            pageModel.setSelectedSection(WALLET_SECTION);
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
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          curve: Curves.fastOutSlowIn,
                          constraints: BoxConstraints(
                            maxHeight:
                                pageModel.selectedSection == WALLET_SECTION
                                    ? 200
                                    : 0,
                          ),
                          decoration: BoxDecoration(
                            color: appColors.transparent,
                            boxShadow: [
                              BoxShadow(color: appColors.lightGrey),
                              BoxShadow(
                                color: appColors.white,
                                spreadRadius: -3, // Độ lan rộng của shadow
                                blurRadius: 5, // Độ mờ của shadow
                              ),
                            ],
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: pageModel.listWallets.length,
                              itemBuilder: (context, index) {
                                final Widget widget =
                                    pageModel.listWallets[index].widget;
                                final dynamic value =
                                    pageModel.listWallets[index].value;
                                return GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    pageModel.setSelectedSection(null);
                                  },
                                  child: widget,
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  Divider(thickness: 1, color: appColors.grey),
                            ),
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            pageModel.setSelectedSection(CATEGORY_SECTION);
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
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          curve: Curves.fastOutSlowIn,
                          decoration: BoxDecoration(
                            color: appColors.transparent,
                            boxShadow: [
                              BoxShadow(color: appColors.lightGrey),
                              BoxShadow(
                                color: appColors.white,
                                spreadRadius: -3, // Độ lan rộng của shadow
                                blurRadius: 5, // Độ mờ của shadow
                              ),
                            ],
                          ),
                          height: pageModel.selectedSection == CATEGORY_SECTION
                              ? 200
                              : 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: pageModel.listCategories.length,
                              itemBuilder: (context, index) {
                                final Widget widget =
                                    pageModel.listCategories[index].widget;
                                final dynamic value =
                                    pageModel.listCategories[index].value;
                                return GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    pageModel.setSelectedSection(null);
                                    pageModel.setSelectedCategory(value);
                                  },
                                  child: widget,
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  Divider(thickness: 1, color: appColors.grey),
                            ),
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            pageModel.setSelectedSection(null);
                            appPopup.dateTimePickerPopup(
                              context,
                              title: Text("Chọn thời gian",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: appColors.darkPurple)),
                              callback: (dynamic value) {
                                pageModel.setSelectedDate(value);
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
                            pageModel.setSelectedSection(NOTE_SECTION);
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
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          curve: Curves.fastOutSlowIn,
                          constraints: BoxConstraints(
                            maxHeight: pageModel.selectedSection == NOTE_SECTION
                                ? 200
                                : 0,
                          ),
                          decoration: BoxDecoration(
                            color: appColors.transparent,
                            boxShadow: [
                              BoxShadow(color: appColors.lightGrey),
                              BoxShadow(
                                color: appColors.white,
                                spreadRadius: -3, // Độ lan rộng của shadow
                                blurRadius: 5, // Độ mờ của shadow
                              ),
                            ],
                          ),
                          child: Visibility(
                            visible: pageModel.selectedSection == NOTE_SECTION,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: TextFormField(
                                controller: pageModel.noteController,
                                textAlign: TextAlign.start,
                                minLines: 5,
                                maxLines: 10,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: appColors.transparent,
                                  alignLabelWithHint: true,
                                  isDense: true,
                                  contentPadding: const EdgeInsets.all(10),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  label: Row(
                                    children: [
                                      Icon(
                                        Remix.edit_2_line,
                                        color: appColors.charcoal,
                                      ),
                                      Text(
                                        "Nhập ghi chú...",
                                        style: TextStyle(
                                            color: appColors.charcoal),
                                      )
                                    ],
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: appColors.lightGrey),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: appColors.lightGrey),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onChanged: (value) {
                                  pageModel.setNote(value);
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
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
                        pageModel.createTransaction(context);
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
