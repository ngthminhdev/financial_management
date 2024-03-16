import 'package:financial_management/core/color.dart';
import 'package:financial_management/helper/navigator_helper.dart';
import 'package:financial_management/router/router_config.dart';
import 'package:financial_management/widgets/button/button_constant.dart';
import 'package:financial_management/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isSaveYourLogin = false;

  void toggleSaveLogin(bool? value) {
    setState(() {
      isSaveYourLogin = !isSaveYourLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.85,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
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
                            color: AppColors.purple,
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
                      controller: usernameController,
                      label: 'Tài khoản',
                      icon: Symbols.account_child,
                    ),
                    FMInput(
                      isObscured: true,
                      controller: passwordController,
                      label: 'Mật khẩu',
                      icon: Symbols.password,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FMCheckBox(
                            text: "Ghi nhớ đăng nhập?",
                            value: isSaveYourLogin,
                            onChange: (bool? value) {
                              toggleSaveLogin(value);
                            }),
                      ],
                    )
                  ],
                ),
                FMButton(text: 'Đăng nhập', size: FMButtonSize.max),
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
                              context, RouteNames.register);
                        },
                        child: Text(
                          'Đăng ký',
                          style: TextStyle(
                            color: AppColors.purple,
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
    );
  }
}
