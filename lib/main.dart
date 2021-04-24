import 'package:financial_manager_system/pages/login_page.dart';
// import 'package:financial_manager_system/pages/register_page.dart';
// import 'package:financial_manager_system/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "家庭理财管理系统",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.white),
        home: LoginPage()
        // home: RegisterPage()
        // home: HomePage()
    );
  }
}
