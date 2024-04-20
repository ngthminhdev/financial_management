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
import 'package:financial_management/widgets/popups/app_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class BudgetPageModel extends BasePageModel {
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
  int transactionType = TRANSACTION_TYPE_SPENT;

  initData(BuildContext context) async {
    amountController.text = "";
    await getCategory(context);
  }

  resetData() {
    selectedCategory = null;
    note = null;
    amountController.text = "";
    notifyListeners();
  }

  Future<void> getCategory(BuildContext context) async {
    try {
      Map<String, String> queries = {};

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
      notifyListeners();
    } catch (e) {
      print(e);
      appPopup.messagePopup(context,
          message: e is Response ? e.message : appConstant.unknownError,
          type: PopupType.error);
    }
  }

  setSelectedCategory(String? categoryId) {
    if (categoryId != null) {
      CategoryModel? selectCategory = mapCategories[categoryId];
      selectedCategory = selectCategory;
      notifyListeners();
    }
  }

  setSelectedDate(DateTime? value) {
    if (value != null) {
      selectedDate = value;
      notifyListeners();
    }
  }

  setNote(String? value) {
    if (value != null) {
      note = value;
      notifyListeners();
    }
  }

  setTransactionType(int? value) {
    if (value == 1) {
      transactionType = TRANSACTION_TYPE_INCOME;
    } else {
      transactionType = TRANSACTION_TYPE_SPENT;
    }
    notifyListeners();
  }

  Future<void> createTransaction(BuildContext context) async {
    try {
      if (selectedCategory == null || amountController.text.isEmpty) {
        return appPopup.messagePopup(context,
            message: 'Vui lòng nhập đủ thông tin', type: PopupType.warning);
      }
      setBusy(true);
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
      setBusy(false);
      return appPopup.messagePopup(context, message: response.message,
          callback: () {
        resetData();
      });
    } catch (e) {
      setBusy(false);
      appPopup.messagePopup(context,
          message: e is Response ? e.message : appConstant.unknownError,
          type: PopupType.error);
    }
  }
}
