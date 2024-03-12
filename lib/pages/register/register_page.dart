import 'package:financial_management/constant/common_constant.dart';
import 'package:financial_management/core/color.dart';
import 'package:financial_management/helper/navigator_helper.dart';
import 'package:financial_management/router/router_config.dart';
import 'package:financial_management/widgets/button/button_constant.dart';
import 'package:financial_management/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

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
            height: MediaQuery.of(context).size.height * 0.9,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                          "Get started!",
                          style: TextStyle(
                            color: AppColors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        const Text(
                          "Create an account",
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
                              "Do you already have an account?",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  navigatorHelper.changeView(
                                      context, RouteNames.login);
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: AppColors.purple,
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
                        label: 'Account Name',
                        icon: Symbols.account_circle,
                        validator: (text) {
                          if (text!.length < 6 || text.length > 20) {
                            return 'Account name is between 6 and 20 characters';
                          }
                          return null;
                        },
                      ),
                      FMInput(
                        controller: usernameController,
                        label: 'User Name',
                        icon: Symbols.account_child,
                        validator: (text) {
                          if (text!.length < 6 || text.length > 20) {
                            return 'User name is between 6 and 20 characters';
                          } else if (!whiteSpaceRegex.hasMatch(text)) {
                            return 'User name can\'t have white space. ex: ngthminh';
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
                            return 'Email is not valid';
                          }
                          return null;
                        },
                      ),
                      FMInput(
                        isObscured: true,
                        controller: passwordController,
                        label: 'Password',
                        icon: Symbols.password,
                        validator: (text) {
                          if (text!.length < 6) {
                            return 'Password is at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      FMInput(
                        isObscured: true,
                        controller: passwordConfirmController,
                        label: 'Confirm Passoword',
                        icon: Symbols.password_rounded,
                        validator: (text) {
                          if (text != passwordController.text) {
                            return 'Confirm password and password is not same';
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
