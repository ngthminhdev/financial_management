import 'dart:convert';

import 'package:financial_management/base/base_page_model.dart';
import 'package:financial_management/constant/app_constant.dart';
import 'package:financial_management/model/category_model.dart';
import 'package:financial_management/model/user_model.dart';
import 'package:financial_management/model/wallet_model.dart';
import 'package:financial_management/services/api/transaction_service.dart';
import 'package:financial_management/services/http_service.dart';
import 'package:financial_management/services/local_storage_service.dart';
import 'package:financial_management/widgets/popups/app_popup.dart';
import 'package:flutter/material.dart';

class HomePageModel extends BasePageModel {
  late BuildContext context;
  User? user;
  WalletModel? wallet;
  List<CategoryModel> listExpensive = [];


  initData(BuildContext context) async {
    this.context = context;
    await Future.wait([
      getUserInfo(),
      getChartData(),
      getListExpensive(),
    ]);
    notifyListeners();
  }

  Future getUserInfo() async {
    String? userJson = await LocalStorageService().getString('userInfo');
    if (userJson != null) {
      user = User.fromJson(jsonDecode(userJson));
    }
    // notifyListeners();
  }

  Future getChartData() async {
    try {
      Map<String, String> queries = { 'type': '1' };
      List<WalletModel> wallets = await TransactionService().getWallets(queries);
      wallet = wallets.first;
      
    } catch (e) {
      print(e);
      appPopup.messagePopup(context,
          message: e is Response ? e.message : appConstant.unknownError,
          type: PopupType.error);
    }
  }

  Future<void> getListExpensive() async {
    try {
      Map<String, String> queries = {
        "type": '2',
        "wallet_id": "526d288e-3eef-49a4-be61-6f32536b9c21",
      };

      List<CategoryModel> list =
          await TransactionService().getTransactionGroupByCategory(queries);
      listExpensive = list;
      // totalSpent =
      //     list.fold(0, (total, category) => total += category.amountUsed!);

      // notifyListeners();
    } catch (e) {
      print(e);
      appPopup.messagePopup(context,
          message: e is Response ? e.message : appConstant.unknownError,
          type: PopupType.error);
    }
  }
}
