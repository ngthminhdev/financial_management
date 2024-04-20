import 'package:financial_management/base/base_page_model.dart';
import 'package:financial_management/constant/app_constant.dart';
import 'package:financial_management/model/transaction_history_model.dart';
import 'package:financial_management/services/api/transaction_service.dart';
import 'package:financial_management/services/http_service.dart';
import 'package:financial_management/widgets/popups/app_popup.dart';
import 'package:flutter/material.dart';

class AnalyticPageModel extends BasePageModel {
  List<TransactionHistoryModel> chartData = [];
  TotalInOutModel totalInOut = TotalInOutModel(income: 0, spent: 0);
  BuildContext? context;

  initData(BuildContext context) async {
    setBusy(true);
    this.context = context;
    await getChartData();
    setBusy(false);
  }

  Future<void> getChartData() async {
    try {
      Map<String, String> queries = {
        'wallet_id': '526d288e-3eef-49a4-be61-6f32536b9c21'
      };

      InOutAnalyticsChartModel inOutTransactions =
          await TransactionService().getListInOutTransaction(queries);
      chartData = inOutTransactions.list;
      totalInOut = inOutTransactions.total;
      notifyListeners();
    } catch (e) {
      appPopup.messagePopup(context!,
          message: e is Response ? e.message : appConstant.unknownError,
          type: PopupType.error);
    }
  }
}
