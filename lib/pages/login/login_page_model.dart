import 'dart:convert';

import 'package:financial_management/base/base_page_model.dart';
import 'package:financial_management/constant/app_constant.dart';
import 'package:financial_management/helper/navigator_helper.dart';
import 'package:financial_management/model/user_model.dart';
import 'package:financial_management/router/router_config.dart';
import 'package:financial_management/services/api/auth_service.dart';
import 'package:financial_management/services/http_service.dart';
import 'package:financial_management/services/local_storage_service.dart';
import 'package:financial_management/widgets/popups/select_popup_widget.dart';
import 'package:flutter/material.dart';

class LoginPageModel extends BasePageModel {
  GlobalKey<NavigatorState> dialogKey = GlobalKey<NavigatorState>();
  TextEditingController accountNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isSaveYourLogin = false;

  void toggleSaveLogin(bool? value) {
    isSaveYourLogin = !isSaveYourLogin;
  }

  Future<void> login(BuildContext context) async {
    try {
      if (accountNameController.text.isEmpty ||
          passwordController.text.isEmpty) {
        return appPopup.messagePopup(context,
            message: 'Vui lòng nhập đủ thông tin', type: PopupType.warning);
      }

      setBusy(true);
      Map<String, dynamic> body = {
        'account_name': accountNameController.text,
        'password': passwordController.text,
      };

      User user = await AuthService().login(body);
      LocalStorageService localStorageService = LocalStorageService();

      List<Future> futures = [
        localStorageService.setString('JWT', user.accessToken),
        localStorageService.setString('userInfo', jsonEncode(user.toJson())),
      ];
      if (isSaveYourLogin) {
        futures.add(
          localStorageService.setBool('isSaveLoggedIn', true),
        );
      }

      await Future.wait(futures);
      setBusy(false);
      return navigatorHelper.changeView(context, RouteNames.main, isReplaceName: true);
    } catch (e) {
      setBusy(false);
      appPopup.messagePopup(context,
      message:e is Response ? e.message: appConstant.unknownError, type: PopupType.error);
    }
  }
}
