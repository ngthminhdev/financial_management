import 'package:flutter/material.dart';

class RouteNames {
	static const String home = 'Home';
}

class RouteCreator {
	static Map<String, dynamic> routes = {
		// home
		RouteNames.home: BaseRoute(RouteNames.home, 'Home', view: ({settings, params}) => Container())
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
