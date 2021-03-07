import 'package:flutter/material.dart';
import 'package:food_bill/food_bill_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodBillHomePage(),
    );
  }
}
