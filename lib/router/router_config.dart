import 'package:financial_management/pages/analytics/analytics_page.dart';
import 'package:financial_management/pages/analytics/budget_analytics_page.dart';
import 'package:financial_management/pages/budget/budget_page.dart';
import 'package:financial_management/pages/home/home_page.dart';
import 'package:financial_management/pages/login/login_page.dart';
import 'package:financial_management/pages/more/more_page.dart';
import 'package:financial_management/pages/plan/plan_page.dart';
import 'package:financial_management/pages/register/register_page.dart';
import 'package:flutter/material.dart';

class RouteNames {
  static const String home = 'Home';
  static const String plan = 'Plan';
  static const String budget = 'Budget';
  static const String analytics = 'Analytics';
  static const String more = 'More';

  static const String register = 'Register';
  static const String login = 'Login';

  static const String budgetAnalytics = 'BudgetAnalytics';
}

class RouteCreator {
  static Map<String, dynamic> routes = {
        RouteNames.register: BaseRoute(RouteNames.register, 'Register',
        view: ({settings, params}) => RegisterPage()),
    RouteNames.login: BaseRoute(RouteNames.login, 'Login',
        view: ({settings, params}) => LoginPage()),

    RouteNames.home: BaseRoute(RouteNames.home, 'Home',
        view: ({settings, params}) => HomePage()),
    RouteNames.plan: BaseRoute(RouteNames.plan, 'Plan',
        view: ({settings, params}) => PlanPage()),
    RouteNames.budget: BaseRoute(RouteNames.plan, 'Budget',
        view: ({settings, params}) => BudgetPage()),

    RouteNames.budgetAnalytics: BaseRoute(RouteNames.budgetAnalytics, 'BudgetAnalytics',
        view: ({settings, params}) => BudgetAnalyticsPage()),
    RouteNames.analytics: BaseRoute(RouteNames.analytics, 'Analytics',
        view: ({settings, params}) => AnalyticsPage()),
    RouteNames.more: BaseRoute(RouteNames.more, 'More',
        view: ({settings, params}) => MorePage()),


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
