import 'package:financial_management/base/base_page_model.dart';
import 'package:financial_management/constant/app_constant.dart';
import 'package:financial_management/helper/date_helper.dart';
import 'package:financial_management/helper/number_helper.dart';
import 'package:financial_management/model/category_model.dart';
import 'package:financial_management/pages/budget/constants.dart';
import 'package:financial_management/services/api/category_service.dart';
import 'package:financial_management/services/api/transaction_service.dart';
import 'package:financial_management/services/http_service.dart';
import 'package:financial_management/widgets/button/row_select.dart';
import 'package:financial_management/widgets/popups/select_popup_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class BudgetPageModel extends BasePageModel {
  BudgetPageModel(BuildContext context) : super(context);
  GlobalKey<NavigatorState> dialogKey = GlobalKey<NavigatorState>();

  final MoneyMaskedTextController amountController = MoneyMaskedTextController(
    thousandSeparator: ',',
    decimalSeparator: ',',
    initialValue: 0,
    precision: 3,
  );

  List<PopupItem> listCategories = [];
  Map<String, CategoryModel> mapCategories = {};
  CategoryModel? selectedCategory;

  DateTime selectedDate = DateTime.now();
  String? note;
  int transactionType = TRANSACTION_TYPE_INCOME;

  initData() async {
    amountController.text = "";
    await getCategory();
  }

  resetData() {
    selectedCategory = null;
    note = null;
    amountController.text = "";
  }

  Future<void> getCategory() async {
    try {
      Map<String, String> queries = {
      };

      List<CategoryModel> list = await CategoryService().getList(queries);
      for (var category in list) {
        final PopupItem item = PopupItem(
            widget: RowSelectWidget(
              icon: appConstant.categoryIconMap[category.icon]!,
              title: category.name,
            ),
            value: category.id);

        listCategories.add(item);
        mapCategories[category.id] = category;
      }
    } catch (e) {
      Response error = e as Response;
      appPopup.messagePopup(context,
          message: error.message, type: PopupType.error);
    }
  }

  setSelectedCategory(String? categoryId) {
    if (categoryId != null) {
      CategoryModel? selectCategory = mapCategories[categoryId];
      selectedCategory = selectCategory;
    }
  }

  setSelectedDate(DateTime? value) {
    if (value != null) {
      selectedDate = value;
    }
  }

  setNote(String? value) {
    if (value != null) {
      note = value;
    }
  }

  setTransactionType(int? value) {
    if (value == 0) {
      transactionType = TRANSACTION_TYPE_INCOME;
    } else {
      transactionType = TRANSACTION_TYPE_SPENT;
    }
  }

  Future<void> createTransaction() async {
    try {
      setBusy(dialogKey, true);
      Map<String, dynamic> body = {
        "type": transactionType,
        "category_id": selectedCategory!.id,
        "wallet_id": "526d288e-3eef-49a4-be61-6f32536b9c21",
        "goat_id": "",
        "date": DateHelper.formatWith(selectedDate),
        "note": note ?? '',
        "amount": NumberHelper.moneyConvert(amountController.text),
      };

      Response response = await TransactionService().create(body);
      setBusy(dialogKey, false);
      appPopup.messagePopup(context, message: response.message, callback: () {
        resetData();
      });
    } catch (e) {
      setBusy(dialogKey, false);
      Response error = e as Response;
      appPopup.messagePopup(context,
          message: error.message, type: PopupType.error);
    }
  }
}
