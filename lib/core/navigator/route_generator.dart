import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:write/core/core.dart';
import 'package:write/features/features.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final Object? args = settings.arguments;

    switch (settings.name) {
      case '/':
        return pageRoute(const SplashView());

      case AuthView.route:
        return pageRoute(const AuthView());

      default:
        return errorRoute();
    }
  }

  static PageRoute pageRoute(Widget page) {
    if (!kIsWeb && Platform.isIOS) {
      return CupertinoPageRoute(builder: (_) => page);
    }

    return MaterialPageRoute(builder: (_) => page);
  }
}
