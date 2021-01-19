import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letsdotest/info/about.dart';


import 'homepage.dart';

class RouteGenerator {
  static const String homePage = '/';
  static const String testPage = '/testpage';
  static const String aboutPage = '/aboutpage';
  static const String helpPage = '/helppage';
  static const String resultPage = '/resultpage';

  RouteGenerator._() {}

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => MyHomePage(),
        );
      case aboutPage:
        return MaterialPageRoute(
          builder: (_) => /*const */ AboutPage(),

        );
    }
  }
}