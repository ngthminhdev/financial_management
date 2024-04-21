import 'package:financial_management/constant/app_constant.dart';
import 'package:financial_management/model/category_model.dart';
import 'package:financial_management/model/transaction_history_model.dart';
import 'package:financial_management/model/wallet_model.dart';
import 'package:financial_management/services/http_service.dart';

class TransactionService {
  String endpoint = 'transaction';
  late HttpService http;

  TransactionService() {
    http = HttpService();
    http.withHost(appConstant.apiHost);
    http.withPath(endpoint);
  }

  Future<Response> create(Map<String, dynamic> body) async {
    http.makePost();
    http.withBody(body);

    Response response = await http.execute();
    return response;
  }

  Future<List<TransactionHistoryModel>> getList(
      Map<String, String> queries) async {
    http.makeGet();
    http.withQueries(queries);

    Response response = await http.execute();
    List<TransactionHistoryModel> list = [];

    for (var json in List<dynamic>.from(response.data)) {
      final TransactionHistoryModel transaction =
          TransactionHistoryModel.fromJson(json);
      list.add(transaction);
    }

    return list;
  }

  Future<List<CategoryModel>> getTransactionGroupByCategory(
      Map<String, String> queries) async {
    http.withPath('category-group');
    http.makeGet();
    http.withQueries(queries);

    Response response = await http.execute();
    List<CategoryModel> list = [];

    for (var json in List<dynamic>.from(response.data)) {
      final CategoryModel category = CategoryModel.fromJson(json);
      list.add(category);
    }

    return list;
  }

  Future<InOutAnalyticsChartModel> getListInOutTransaction(
      Map<String, String> queries) async {
    http.withPath('in-out');
    http.makeGet();
    http.withQueries(queries);

    Response response = await http.execute();
    final InOutAnalyticsChartModel data =
        InOutAnalyticsChartModel.fromJson(response.data);
    return data;
  }

  Future<List<WalletModel>> getWallets(Map<String, String> queries) async {
    http.withPath('wallet');
    http.makeGet();
    http.withQueries(queries);

    Response response = await http.execute();
    List<WalletModel> list = [];

    for (var json in List<dynamic>.from(response.data)) {
      final WalletModel wallet = WalletModel.fromJson(json);
      list.add(wallet);
    }

    return list;
  }
}
