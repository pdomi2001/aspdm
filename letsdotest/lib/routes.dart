import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letsdotest/main.dart';

class RouteGenerator {
  static const string homePage = '/';
  static const string testPage = '/testpage';
  static const string aboutPage = '/aboutpage';
  static const string helpPage = '/helppage';
  static const string resultPage = '/resultpage';

  RouteGenerator._() {}

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const MyHomePage(),
        );
    }
  }
}