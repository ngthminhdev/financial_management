import 'package:financial_management/pages/login/login_page.dart';
import 'package:financial_management/pages/register/register_page.dart';
import 'package:flutter/material.dart';

class RouteNames {
	static const String home = 'Home';
	static const String register = 'Register';
	static const String login = 'Login';
}

class RouteCreator {
	static Map<String, dynamic> routes = {
		// home
		RouteNames.home: BaseRoute(RouteNames.home, 'Home', view: ({settings, params}) => Container()),

		RouteNames.register: BaseRoute(RouteNames.register, 'Register', view: ({settings, params}) => RegisterPage()),
		RouteNames.login: BaseRoute(RouteNames.login, 'Login', view: ({settings, params}) => LoginPage()),

	};
}

class BaseRoute {
  final String routeName;
  final String routeTitle;
  final Widget Function({
    RouteSettings? settings,
    Map<String, String>? params,
  })? view;

  BaseRoute(this.routeName, this.routeTitle, {this.view});
}

BaseRoute? Function(String?) getRoute = (String? routeName) {
  return RouteCreator.routes[routeName];
};
