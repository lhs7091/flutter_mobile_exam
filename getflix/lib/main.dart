import 'package:flutter/material.dart';
import 'package:getflix/export.dart';
import 'package:getflix/providers/weekly_trending_movie_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => PopularMovieProvider(),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => TopRatedMovieProvider(),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => WeeklyTrendingMovieProvider(),
          ),
        ],
        child: RootScreen(),
      ),
    );
  }
}
