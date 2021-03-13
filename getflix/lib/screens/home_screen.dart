import 'package:flutter/material.dart';
import 'package:getflix/export.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PopularMovieProvider _popluarMovieProvider;
  List<PopularMovie> popularMovieList;

  TopRatedMovieProvider _topRatedMovieProvider;
  WeeklyTrendingMovieProvider _weeklyTrendingMovieProvider;

  bool isLoading = false;
  var size;
  String pictureUrl = 'https://image.tmdb.org/t/p/w500';

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    // Popula moive provider 생성
    _popluarMovieProvider =
        Provider.of<PopularMovieProvider>(context, listen: false);

    // top rated movie provider 생성
    _topRatedMovieProvider =
        Provider.of<TopRatedMovieProvider>(context, listen: false);

    // weekly trending movie provider 생성
    _weeklyTrendingMovieProvider =
        Provider.of<WeeklyTrendingMovieProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Consumer<PopularMovieProvider>(
        builder: (context, provider, widget) {
          if (provider.getPopularMovieList() != null &&
              provider.getPopularMovieList().length > 0) {
            popularMovieList = provider.getPopularMovieList();
            return getBody(popularMovieList);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      //child: getBody()
    );
  }

  Widget getBody(List<PopularMovie> popularMovieList) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          // background and buttons, each movie list
          Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    // background image
                    Container(
                      height: size.height * 0.6,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              pictureUrl + popularMovieList[0].posterPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: size.height * 0.6,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                // My list, play button, info button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // MyList button
                    Column(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 25.0,
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'My List',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    //play Button
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 2.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.play_arrow,
                              color: Colors.black,
                              size: 30.0,
                            ),
                            Text(
                              'Play',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Info button
                    Column(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.white,
                          size: 25.0,
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Info',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 40.0),
                buildEachList(popularMovieList, 'Popular List'),
                SizedBox(height: 30),
                buildEachList(_topRatedMovieProvider.getTopRatedMovieList(),
                    'Top Rated List'),
                SizedBox(height: 30),
                buildEachList(
                    _weeklyTrendingMovieProvider.getWeeklyTrendingMovie(),
                    'Weekily Trending'),
              ],
            ),
          ),
          // Logo, BookMark, Profile
          Container(
            child: SafeArea(
              child: Column(
                children: [
                  // Logo, BookMark, Profile on first line
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/logo.ico',
                          width: 35,
                          fit: BoxFit.cover,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.collections_bookmark,
                                color: Colors.white,
                                size: 25.0,
                              ),
                            ),
                            SizedBox(width: 5.0),
                            CircleAvatar(
                              radius: 20.0,
                              backgroundImage: NetworkImage(
                                  'https://avatars.githubusercontent.com/u/52806121?s=460&u=9ca6dab24cb30bfd2f8ea8d80c750247f7b41ede&v=4'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0),
                  // TV shows, Movies, Categories...
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildMainMenu('TV Shows'),
                      buildMainMenu('Movies'),
                      Row(
                        children: [
                          buildMainMenu('Categories'),
                          SizedBox(width: 5.0),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEachList(var movieList, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(movieList.length, (index) {
                return Container(
                  margin: EdgeInsets.only(right: 5.0),
                  width: size.width * 0.23,
                  height: size.height * 0.23,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                          pictureUrl + movieList[index].posterPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }

  Widget buildMainMenu(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 15.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
