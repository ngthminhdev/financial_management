import 'package:financial_management/helper/navigator_helper.dart';
import 'package:financial_management/router/router_config.dart';
import 'package:financial_management/services/api/auth_service.dart';
import 'package:financial_management/services/http_service.dart';
import 'package:financial_management/widgets/popups/select_popup_widget.dart';
import 'package:flutter/material.dart';

class RegisterPageModel {
  TextEditingController accountNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  Future<void> register(BuildContext context) async {
    try {
      if (accountNameController.text.isEmpty ||
          usernameController.text.isEmpty ||
          emailController.text.isEmpty ||
          passwordController.text.isEmpty ||
          passwordConfirmController.text.isEmpty) {
        return appPopup.messagePopup(context,
            message: 'Vui lòng nhập đủ thông tin', type: PopupType.warning);
      }

      Map<String, dynamic> body = {
        'account_name': accountNameController.text,
        'user_name': usernameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'confirm_password': passwordConfirmController.text,
      };

      Response response = await AuthService().register(body);
      // ignore: use_build_context_synchronously
      appPopup.messagePopup(context, message: response.message, callback: () {
        navigatorHelper.changeView(context, RouteNames.login,
            isReplaceName: true);
      });
    } catch (e) {
      Response error = e as Response;
      appPopup.messagePopup(context,
          message: error.message, type: PopupType.error);
    }
  }
}
