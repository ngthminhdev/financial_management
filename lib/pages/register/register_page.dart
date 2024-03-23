import 'package:financial_management/constant/common_constant.dart';
import 'package:financial_management/core/color.dart';
import 'package:financial_management/helper/navigator_helper.dart';
import 'package:financial_management/router/router_config.dart';
import 'package:financial_management/widgets/button/button_constant.dart';
import 'package:financial_management/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:page_transition/page_transition.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController accountNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.85,
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
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
                          "Chào mừng bạn!",
                          style: TextStyle(
                            color: appColors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        const Text(
                          "Đăng ký tài khoản mới",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Đã có tài khoản?",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  navigatorHelper.changeView(
                                      context, RouteNames.login,
                                      isReplaceName: true,
                                      type: PageTransitionType.rightToLeft);
                                },
                                child: Text(
                                  'Đăng nhập',
                                  style: TextStyle(
                                    color: appColors.purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ))
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Expanded(
                  // height: MediaQuery.of(context).size.height * 0.50,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FMInput(
                        controller: accountNameController,
                        label: 'Họ và tên',
                        icon: Symbols.account_circle,
                        validator: (text) {
                          if (text!.length < 6 || text.length > 20) {
                            return 'Họ và tên cần từ 6 đến 20 ký tự';
                          }
                          return null;
                        },
                      ),
                      FMInput(
                        controller: usernameController,
                        label: 'Tài khoản',
                        icon: Symbols.account_child,
                        validator: (text) {
                          if (text!.length < 6 || text.length > 20) {
                            return 'Tài khoản cần từ 6 đến 20 ký tự';
                          } else if (!whiteSpaceRegex.hasMatch(text)) {
                            return 'Tài khoản không được có khoảng trắng';
                          }
                          return null;
                        },
                      ),
                      FMInput(
                        controller: emailController,
                        label: 'Email',
                        icon: Symbols.email,
                        validator: (text) {
                          if (!emailRegex.hasMatch(text!)) {
                            return 'Email không hợp lệ';
                          }
                          return null;
                        },
                      ),
                      FMInput(
                        isObscured: true,
                        controller: passwordController,
                        label: 'Mật khẩu',
                        icon: Symbols.password,
                        validator: (text) {
                          if (text!.length < 6) {
                            return 'Mật khẩu ít nhất 6 ký tự';
                          }
                          return null;
                        },
                      ),
                      FMInput(
                        isObscured: true,
                        controller: passwordConfirmController,
                        label: 'Nhập lại mật khẩu',
                        icon: Symbols.password_rounded,
                        validator: (text) {
                          if (text != passwordController.text) {
                            return 'Nhập lại mật khẩu không đúng';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                FMButton(text: 'Sign up', size: FMButtonSize.max),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
