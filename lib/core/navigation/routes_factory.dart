import 'package:flutter/material.dart';
import 'package:exercise/core/navigation/routes.dart';

class RoutesFactory {
  static String get initialRoute => Routes.home;

  static Map<String, Widget Function(BuildContext, dynamic)> get _routes => {};

  static Route<dynamic> getGeneratedRoutes(RouteSettings settings) =>
      MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) =>
            _routes[settings.name]!(context, settings.arguments),
      );
}
