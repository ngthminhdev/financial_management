import 'package:financial_management/base/base_mixin_model.dart';
import 'package:financial_management/core/color.dart';
import 'package:financial_management/helper/navigator_helper.dart';
import 'package:financial_management/pages/login/login_page_model.dart';
import 'package:financial_management/router/router_config.dart';
import 'package:financial_management/widgets/button/button_constant.dart';
import 'package:financial_management/widgets/loading/loading_widget.dart';
import 'package:financial_management/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with MixinModel<LoginPageModel>, SingleTickerProviderStateMixin {
  LoginPageModel pageModel = LoginPageModel();

  @override
  LoginPageModel withModel() {
    return pageModel;
  }

  @override
  Widget build(BuildContext context) {
    return present(context);
  }

  @override
  Function(BuildContext context, LoginPageModel model, Widget? child)
      withBuilder() {
    return (BuildContext context, LoginPageModel model, Widget? child) {
      return ModalProgressHUD(
        inAsyncCall: pageModel.busy,
        progressIndicator: const LoadingWidget(),
        child: buildBody(context),
      );
    };
  }

  Widget buildBody(BuildContext context) {
    return Scaffold(
      key: pageModel.dialogKey,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
          },
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.85,
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 40),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Chào mừng trở lại!",
                            style: TextStyle(
                              color: appColors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          const Text(
                            "Quản lý tài chính cá nhân",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FMInput(
                        controller: pageModel.accountNameController,
                        label: 'Tài khoản',
                        icon: Symbols.account_circle,
                      ),
                      FMInput(
                        isObscured: true,
                        controller: pageModel.passwordController,
                        label: 'Mật khẩu',
                        icon: Symbols.password,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FMCheckBox(
                              text: "Ghi nhớ đăng nhập?",
                              value: pageModel.isSaveYourLogin,
                              onChange: (bool? value) {
                                setState(() {
                                  pageModel.toggleSaveLogin(value);
                                });
                                print('${pageModel.isSaveYourLogin}');
                                print('$value');
                              }),
                        ],
                      )
                    ],
                  ),
                  FMButton(
                    text: 'Đăng nhập',
                    size: FMButtonSize.max,
                    onPressed: () async {
                      pageModel.login(context);
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Bạn chưa có tài khoản?",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            navigatorHelper.changeView(
                                context, RouteNames.register,
                                isReplaceName: true,
                                type: PageTransitionType.leftToRight);
                          },
                          child: Text(
                            'Đăng ký',
                            style: TextStyle(
                              color: appColors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
