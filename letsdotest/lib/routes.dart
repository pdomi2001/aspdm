import 'package:flutter/material.dart';
import 'package:letsdotest/info/about.dart';
import 'package:letsdotest/selecttest.dart';
import 'package:letsdotest/test/completetest.dart';
import 'package:letsdotest/test/resultpage.dart';
import 'package:letsdotest/waitfortest.dart';

import 'homepage.dart';

class RouteGenerator {
  static const String homePage = '/';
  static const String testPage = '/testpage';
  static const String aboutPage = '/aboutpage';
  static const String helpPage = '/helppage';
  static const String resultPage = '/resultpage';
  static const String selectTestPage = '/selecttestpage';
  static const String waitForTestPage = '/waitfortestpage';
  static const String executeTestPage = '/executetestpage';

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
      case executeTestPage:
        return MaterialPageRoute(
          builder: (_) => /*const */ CompleteTest(),
        );
      case waitForTestPage:
        return MaterialPageRoute(
          builder: (_) => /*const */ WaitForTest(),
        );
      case resultPage:
        return MaterialPageRoute(
            builder: (_) => ResultPage()
        );
    }
  }
}
