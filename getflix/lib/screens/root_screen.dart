import 'package:flutter/material.dart';
import 'package:getflix/export.dart';
import 'package:getflix/providers/weekly_trending_movie_provider.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatefulWidget {
  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  var size;
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    // popular provider 생성
    PopularMovieProvider _popluarMovieProvider =
        Provider.of<PopularMovieProvider>(context);
    // load popular movie list from api server
    _popluarMovieProvider.loadPopularMovieList();

    // top Rated movie provider 생성
    TopRatedMovieProvider _topRatedMovieProvider =
        Provider.of<TopRatedMovieProvider>(context);
    _topRatedMovieProvider.loadTopRatedMovieList();

    // weekly trending movie provider 생성
    WeeklyTrendingMovieProvider _weeklyTrendingMovieProvider =
        Provider.of<WeeklyTrendingMovieProvider>(context);
    _weeklyTrendingMovieProvider.loadWeeklyTrendingMovie();

    return IndexedStack(
      index: activeTab,
      children: [
        HomeScreen(),
        ComingSoonScreen(),
        SearchScreen(),
        Center(
            child: Text('downloads screen',
                style: TextStyle(color: Colors.white))),
      ],
    );
  }

  Widget getFooter() {
    return Container(
      height: size.height * 0.1,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(items.length, (index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = index;
                });
              },
              child: Column(
                children: [
                  Icon(
                    items[index]['icon'],
                    color: Colors.white,
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    items[index]['text'],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
