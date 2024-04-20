import 'dart:convert';

import 'package:financial_management/base/base_page_model.dart';
import 'package:financial_management/model/user_model.dart';
import 'package:financial_management/services/local_storage_service.dart';
import 'package:flutter/material.dart';

class MorePageModel extends BasePageModel {
  BuildContext? context;
  User? user;

  initData(BuildContext context) async {
    this.context = context;
    await getUserInfo();
  }

  Future getUserInfo() async {
    String? userJson = await LocalStorageService().getString('userInfo');
    if (userJson != null) {
      user = User.fromJson(jsonDecode(userJson));
    }
    notifyListeners();
  }


}
