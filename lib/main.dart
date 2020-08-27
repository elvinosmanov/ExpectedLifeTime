import 'package:expected_life_time/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:expected_life_time/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.lightBlue[700],
        ),
      ),
      initialRoute: '/',
      routes: {
        HomePage.routeName: (context) => HomePage(),
        ResultPage.routeName: (context) => ResultPage(),
      },
    );
  }
}
