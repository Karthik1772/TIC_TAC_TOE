import 'package:game/features/first%20page/firstPage.dart';
import 'package:game/features/home%20page/home_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(builder: (context) => HomePage());
      case "/firstpage":
        return MaterialPageRoute(builder: (context) => FirstPage());
    }
    return null;
  }
}
