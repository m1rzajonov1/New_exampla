import 'package:flutter/material.dart';
import 'package:newproectap/screens/home_page/home_page_view.dart';
import 'package:newproectap/screens/loader_page.dart';

class Routes {
  static final Routes _instance = Routes._inint();
  static Routes get instance => _instance;
  Routes._inint();

  Route? onGenerateRoue(RouteSettings settings) {
    // var args = settings.arguments;
    switch (settings.name) {
      case '/loader':
        return simpleRoute(LoaderPage());
      case "/home":
        return simpleRoute(HomePage());
      default:
    }
  }

  simpleRoute(Widget route) => MaterialPageRoute(builder: (context) => route);
}
