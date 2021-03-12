import 'package:flutter/material.dart';
import 'package:profile_info/screens.dart/home_screen.dart';

import 'package:profile_info/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Info',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Main_fonts',
          scaffoldBackgroundColor: mainColor),
      home: HomeScreen(),
    );
  }
}
