import 'package:flutter/material.dart';
import 'package:getflix/export.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _textEditingController = TextEditingController();
  SearchMovieProvider _searchMovieProvider;

  bool isSearch = false;
  bool isGetResult = false;

  var size;
  String pictureUrl = 'https://image.tmdb.org/t/p/w500';

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      brightness: Brightness.dark,
      backgroundColor: Colors.black,
      elevation: 0,
      title: Container(
        height: size.height * 0.05,
        decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: _textEditingController,
          onSubmitted: (value) {
            searchMovie(_textEditingController.text);
          },
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            letterSpacing: 1.1,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
              size: 20.0,
            ),
            hintText: 'Search....',
            hintStyle: TextStyle(
              color: Colors.white70,
              fontSize: 20.0,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                _textEditingController.clear();
              },
              icon: Icon(
                Icons.cancel_sharp,
                size: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  searchMovie(String keyWord) async {
    _searchMovieProvider =
        Provider.of<SearchMovieProvider>(context, listen: false);
    await _searchMovieProvider.loadSearchMovieList(keyWord);
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // search results word
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Search Results',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          SizedBox(height: 10.0),

          Consumer<SearchMovieProvider>(
            builder: (context, provider, widget) {
              if (provider.getSearchMovieList() != null &&
                  provider.getSearchMovieList().length > 0) {
                List<SearchMovie> searchList = provider.getSearchMovieList();
                return Column(
                  children: List.generate(searchList.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // search result list
                          Container(
                            width: size.width * 0.85,
                            height: size.height * 0.1,
                            child: Row(
                              children: [
                                // Poster Image
                                Stack(
                                  children: [
                                    Container(
                                      width: size.width * 0.45,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        image: getPoster(searchList[index]),
                                      ),
                                    ),
                                    Container(
                                      width: size.width * 0.45,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.4),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10.0),
                                Flexible(
                                  child: getTitle(searchList[index]),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: size.width * 0.1,
                            child: Center(
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 2.0,
                                    color: Colors.white,
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                );
              } else {
                return Container();
              }
            },
          )
        ],
      ),
    );
  }

  dynamic getPoster(SearchMovie searchMovie) {
    String vaildPosterUrl = '';
    if (searchMovie.backdropPath.toString() != "null") {
      vaildPosterUrl = searchMovie.backdropPath;
    } else {
      if (searchMovie.posterPath.toString() != "null") {
        vaildPosterUrl = searchMovie.posterPath;
      }
    }

    if (vaildPosterUrl != '') {
      return DecorationImage(
          image: NetworkImage(pictureUrl + vaildPosterUrl), fit: BoxFit.cover);
    }
    return DecorationImage(
      image: AssetImage(
        'assets/images/logo.ico',
      ),
      scale: 0.08,
    );
  }

  Widget getTitle(SearchMovie searchMovie) {
    String title = 'No title';
    if (searchMovie.title.toString() != "null") {
      title = searchMovie.title;
    } else {
      if (searchMovie.name.toString() != "null") {
        title = searchMovie.name;
      }
    }

    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 15.0,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
