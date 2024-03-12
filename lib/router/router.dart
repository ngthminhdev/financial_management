import 'package:financial_management/router/router_config.dart';
import 'package:flutter/material.dart';

class Router {
  static Route generateRoute(RouteSettings settings) {
    BaseRoute route = getRoute(settings.name)!;
    Widget? view = route.view!(settings: settings);

    if (view != null) {
      return MaterialPageRoute(builder: (_) => view);
    } else {
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(child: Text('Chức năng này đang được phát triển')),
              ));
    }
  }
}
