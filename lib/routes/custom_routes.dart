import 'package:flutter/material.dart';
import 'package:flutter_qureos/components/bottom_nav.dart';
import 'package:flutter_qureos/routes/routes_names.dart';
import 'package:flutter_qureos/views/forms/form1.dart';
import 'package:flutter_qureos/views/forms/form2.dart';
import 'package:flutter_qureos/views/forms/form3.dart';
import 'package:flutter_qureos/views/home/home.dart';
import 'package:flutter_qureos/views/register/login.dart';
import 'package:flutter_qureos/views/register/register.dart';

import '../not_found.dart';

class CustomRoutes {
  static Route<dynamic> allRoutes(RouteSettings setting) {
    switch (setting.name) {
      case navBar:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case home:
        return MaterialPageRoute(builder: (_) => const Home());
      case login:
        return MaterialPageRoute(builder: (_) =>  LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) =>  const Register());
      case form1:
        return MaterialPageRoute(builder: (_) =>  const FormOne());
      case form2:
        return MaterialPageRoute(builder: (_) =>  const FormTwo());
      case form3:
        return MaterialPageRoute(builder: (_) =>  const FormThree());
    }
    return MaterialPageRoute(builder: (_) => const NotFoundPage());
  }
}
