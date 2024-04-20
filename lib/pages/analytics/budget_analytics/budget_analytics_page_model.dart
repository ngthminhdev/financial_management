import 'package:financial_management/base/base_page_model.dart';
import 'package:financial_management/constant/app_constant.dart';
import 'package:financial_management/core/color.dart';
import 'package:financial_management/model/category_model.dart';
import 'package:financial_management/model/transaction_history_model.dart';
import 'package:financial_management/pages/budget/constants.dart';
import 'package:financial_management/services/api/transaction_service.dart';
import 'package:financial_management/services/http_service.dart';
import 'package:financial_management/widgets/popups/app_popup.dart';
import 'package:flutter/material.dart';

class BudgetAnalyticPageModel extends BasePageModel {
  BudgetAnalyticPageModel();
  final GlobalKey<NavigatorState> dialogKey = GlobalKey<NavigatorState>();
  List<TransactionHistoryModel> listTransactions = [];
  List<CategoryModel> chartData = [];
  double totalSpent = 0;
  String type = '$TRANSACTION_TYPE_SPENT';

  bool isDesc = true;
  Color textColor = appColors.green;
  String title = 'Chi tiết khoản thu';

  initData(BuildContext context, String type) async {
    if (type == '$TRANSACTION_TYPE_SPENT') {
      textColor = appColors.strongOrange;
      title = 'Chi tiết khoản chi';
    }

    this.type = type;
    await Future.wait([
      getChartData(context),
      getTransactionList(context),
    ]);
    notifyListeners();
    // setBusy(false);
  }

  Future<void> getTransactionList(BuildContext context) async {
    try {
      Map<String, String> queries = {
        'skip': '0',
        'limit': '100',
        'sort_by': 'date',
        'sort_type': '-1',
        'type': type,
        'wallet_id': '526d288e-3eef-49a4-be61-6f32536b9c21'
      };

      List<TransactionHistoryModel> transactions =
          await TransactionService().getList(queries);
      listTransactions = transactions;
      // notifyListeners();
    } catch (e) {
      appPopup.messagePopup(context,
          message: e is Response ? e.message : appConstant.unknownError,
          type: PopupType.error);
    }
  }

  Future<void> getChartData(BuildContext context) async {
    try {
      Map<String, String> queries = {
        "type": type,
        "wallet_id": "526d288e-3eef-49a4-be61-6f32536b9c21",
      };

      List<CategoryModel> list =
          await TransactionService().getTransactionGroupByCategory(queries);
      chartData = list;
      totalSpent =
          list.fold(0, (total, category) => total += category.amountUsed!);

      // notifyListeners();
    } catch (e) {
      print(e);
      appPopup.messagePopup(context,
          message: e is Response ? e.message : appConstant.unknownError,
          type: PopupType.error);
    }
  }

  sortListTransaction() {
    isDesc = !isDesc;
    listTransactions = listTransactions.reversed.toList();
    notifyListeners();
  }
}
