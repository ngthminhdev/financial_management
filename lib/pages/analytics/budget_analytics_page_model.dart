import 'package:financial_management/base/base_page_model.dart';
import 'package:financial_management/constant/app_constant.dart';
import 'package:financial_management/model/category_model.dart';
import 'package:financial_management/model/transaction_history_model.dart';
import 'package:financial_management/services/api/transaction_service.dart';
import 'package:financial_management/services/http_service.dart';
import 'package:financial_management/widgets/popups/select_popup_widget.dart';
import 'package:flutter/material.dart';

class BudgetAnalyticPageModel extends BasePageModel {
  BudgetAnalyticPageModel(
      BuildContext context, void Function(void Function()) setState)
      : super(context, setState);
  final GlobalKey<NavigatorState> dialogKey = GlobalKey<NavigatorState>();
  List<TransactionHistoryModel> listTransactions = [];
  List<CategoryModel> chartData = [];
  double totalSpent = 0;

  bool isDesc = true;


  initData() async {
    // setBusy(dialogKey, true, context);
    await Future.wait([
      getChartData(),
      getTransactionList(),
    ]);
    // Navigator.of(context).pop();
    // await Future.delayed(Duration(seconds: 3));
    // setBusy(dialogKey, false, context);
  }

  Future<void> getTransactionList() async {
    try {
      Map<String, String> queries = {
        'skip': '0',
        'limit': '100',
        'sort_by': 'date',
        'sort_type': '-1',
        'wallet_id': '526d288e-3eef-49a4-be61-6f32536b9c21'
      };

      List<TransactionHistoryModel> transactions =
          await TransactionService().getList(queries);
      setState(() {
        listTransactions = transactions;
      });

    } catch (e) {
      appPopup.messagePopup(context,
          message: e is Response ? e.message : appConstant.unknownError,
          type: PopupType.error);
    }
  }

  Future<void> getChartData() async {
    try {
      Map<String, String> queries = {
        "type": '2',
        "wallet_id": "526d288e-3eef-49a4-be61-6f32536b9c21",
      };

      List<CategoryModel> list =
          await TransactionService().getTransactionGroupByCategory(queries);
      setState(() {
        chartData = list;
        totalSpent =
            list.fold(0, (total, category) => total += category.amountUsed!);
      });
    } catch (e) {
      print(e);
      appPopup.messagePopup(context,
          message: e is Response ? e.message : appConstant.unknownError,
          type: PopupType.error);
    }
  }

  sortListTransaction() {
    setState(
      () {
        isDesc = !isDesc;
        listTransactions = listTransactions.reversed.toList();
      },
    );
  }
}
