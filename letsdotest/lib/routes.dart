import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letsdotest/info/about.dart';
import 'package:letsdotest/selecttest.dart';


import 'homepage.dart';

class RouteGenerator {
  static const String homePage = '/';
  static const String testPage = '/testpage';
  static const String aboutPage = '/aboutpage';
  static const String helpPage = '/helppage';
  static const String resultPage = '/resultpage';
  static const String selectTestPage = '/selecttestpage';

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
      case selectTestPage:
        return MaterialPageRoute(
          builder: (_) => /*const */ SelectTest(),

        );
    }
  }
}