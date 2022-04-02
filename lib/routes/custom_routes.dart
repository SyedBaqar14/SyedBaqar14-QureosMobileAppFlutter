import 'package:flutter/material.dart';
import 'package:flutter_qureos/routes/routes_names.dart';
import 'package:flutter_qureos/views/home/home.dart';
import 'package:flutter_qureos/views/register/login.dart';
import 'package:flutter_qureos/views/register/register.dart';

import '../not_found.dart';

class CustomRoutes {
  static Route<dynamic> allRoutes(RouteSettings setting) {
    switch (setting.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const Home());
      case login:
        return MaterialPageRoute(builder: (_) =>  LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) =>  const Register());
    }
    return MaterialPageRoute(builder: (_) => const NotFoundPage());
  }
}
