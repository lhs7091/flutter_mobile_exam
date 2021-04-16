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
        primaryColor: Color(0xfffffdf9),
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.teal,
        appBarTheme: AppBarTheme(
          color: Color(0xfffffdf8),
        ),
        scaffoldBackgroundColor: Color(0xfffffdf9),
      ),
      home: HomeScreen(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
