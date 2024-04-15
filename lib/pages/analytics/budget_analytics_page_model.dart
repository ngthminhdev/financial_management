import 'package:financial_management/base/base_page_model.dart';
import 'package:financial_management/model/transaction_history_model.dart';
import 'package:financial_management/services/api/transaction_service.dart';
import 'package:financial_management/services/http_service.dart';
import 'package:financial_management/widgets/popups/select_popup_widget.dart';

class BudgetAnalyticPageModel extends BasePageModel {
  BudgetAnalyticPageModel(super.context);

  List<TransactionHistoryModel> listTransactions = [];

  initData() async {
    await getTransactionList();
  }

  Future<void> getTransactionList() async {
    try {
      Map<String, String> queries = {
        'skip': '0',
        'limit': '100',
        'sort_by': 'date',
        'sort_type': '-1',
        'wallet_id': 'acfabb2a-cdfc-49b5-bf25-ea08c3f3797b'
      };

      List<TransactionHistoryModel> transactions = await TransactionService().getList(queries);
      listTransactions = transactions;

    } catch (e) {
      Response error = e as Response;
      appPopup.messagePopup(context,
          message: error.message, type: PopupType.error);
    }
  }



}