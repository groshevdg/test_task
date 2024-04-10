import 'package:exercise/core/navigation/routes.dart';
import 'package:exercise/home/presentation/home_page.dart';
import 'package:flutter/material.dart';

class RoutesFactory {
  static String get initialRoute => Routes.home;

  static Map<String, Widget Function(BuildContext, dynamic)> get _routes => {
        Routes.home: (_, __) => const HomePage(),
      };

  static Route<dynamic> getGeneratedRoutes(RouteSettings settings) =>
      MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) =>
            _routes[settings.name]!(context, settings.arguments),
      );
}
