import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:write/core/core.dart';
import 'package:write/features/features.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final Object? args = settings.arguments;

    switch (settings.name) {
      case SplashView.route:
        return pageRoute(const SplashView());

      case AuthView.route:
        return pageRoute(const AuthView());

      case ResetPasswordView.route:
        return pageRoute(const ResetPasswordView());

      case NavBarView.route:
        return pageRoute(NavBarView());

      case WriteView.route:
        return pageRoute(const WriteView());

      case PreviewView.route:
        return pageRoute(const PreviewView());

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
