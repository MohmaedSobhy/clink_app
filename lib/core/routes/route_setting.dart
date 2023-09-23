import 'package:clinck_app/core/routes/route_name.dart';
import 'package:clinck_app/feature/login/screens/login_screen.dart';
import 'package:clinck_app/feature/registration/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class AppRouting {
  static Route? genertateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutesName.signUp:
        return MaterialPageRoute(builder: (_) => const RegistrationScreen());
    }

    return null;
  }
}
