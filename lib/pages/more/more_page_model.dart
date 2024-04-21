import 'dart:convert';

import 'package:financial_management/base/base_page_model.dart';
import 'package:financial_management/helper/navigator_helper.dart';
import 'package:financial_management/model/user_model.dart';
import 'package:financial_management/router/router_config.dart';
import 'package:financial_management/services/local_storage_service.dart';
import 'package:financial_management/widgets/popups/app_popup.dart';
import 'package:flutter/material.dart';

class MorePageModel extends BasePageModel {
  late BuildContext context;
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

  logout() async {
    bool isConfirm =
        await appPopup.confirm(context, "Bạn có chắc muốn đăng xuất");

    if (isConfirm) {
      setBusy(true);
      await Future.wait([
        LocalStorageService().remove("isSaveLoggedIn"),
        LocalStorageService().remove("JWT"),
        LocalStorageService().remove("userInfo"),
      ]);

      navigatorHelper.changeView(context, RouteNames.login,
          isReplaceName: true);
      setBusy(false);
    }
  }
}
