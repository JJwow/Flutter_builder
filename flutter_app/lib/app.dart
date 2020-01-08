import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'page/module_login/login/page.dart';
import 'page/module_login/login_password/page.dart';
import 'page/module_bus/bus_list/page.dart';
Widget createApp() {
  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      'login_page': LoginPage(),
      'login_password_page': Login_passwordPage(),
      'bus_list_page': bus_listPage(),
    },
  );

  return MaterialApp(
    title: 'FishDemo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: routes.buildPage('login_page', null),  //把他作为默认页面
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}