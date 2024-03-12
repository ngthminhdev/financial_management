import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:financial_management/router/router_config.dart' as route_config;

// quản lý việc điều hướng giữa các screen
class NavigatorHelper {
  static final NavigatorHelper _navigatorHelper = NavigatorHelper._internal();

  void changeView(BuildContext context, String routeName,
      {bool isReplaceName = false,
      PageTransitionType type = PageTransitionType.fade,
      Object? arguments,
      Map<String, String>? params}) {
    final route = route_config.getRoute(routeName);
    final Widget view = route!.view!.call(settings: null, params: params);

    if (isReplaceName) {
      Navigator.pushReplacement(
        context,
        PageTransition(
          child: view,
          type: type,
        ),
      );
    } else {
      Navigator.push(
        context,
        PageTransition(
          child: view,
          type: type,
        ),
      );
    }
  }
 // đóng màn hình hiện tại và trả về dl (nếu có)
  popView(context, data) {
    return Navigator.pop(context, data);
  }

  factory NavigatorHelper() {
    return _navigatorHelper;
  }
  NavigatorHelper._internal();
}

final navigatorHelper = NavigatorHelper();

