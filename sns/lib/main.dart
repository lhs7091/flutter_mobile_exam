import 'package:flutter/material.dart';
import 'package:sns/export.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SNS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: Color(0xfffcffef),
        appBarTheme: AppBarTheme(
          color: Color(0xfffcfff1),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xfffcffef),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
