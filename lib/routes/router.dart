import 'package:flutter/material.dart';
import 'package:paytrybe/routes/routes.dart';
import 'package:paytrybe/ui/auth/get-started/get-started.ui.dart';
import 'package:paytrybe/ui/auth/signup/signup.ui.dart';
import 'package:paytrybe/ui/auth/verify-phone/verify-phone.ui.dart';
import 'package:paytrybe/ui/auth/welcome/welcome.ui.dart';
import 'package:paytrybe/ui/home/bottom_nav_page.dart';
import 'package:paytrybe/ui/home/home.ui.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const BottomNavPage());
      case Routes.mainHomeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case Routes.signupRoute:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const SignUpPage(),
          transitionDuration: const Duration(milliseconds: 600),
        );
      case Routes.verifyPhoneRoute:
        return MaterialPageRoute(builder: (_) => const VerifyPhonePage());
      case Routes.getStartedRoute:
        return MaterialPageRoute(builder: (_) => const GetStartedPage());
      case Routes.welcomeRoute:
        return MaterialPageRoute(builder: (_) => const Welcome());

      default:
        return MaterialPageRoute(builder: (_) => const Welcome());
    }
  }
}
