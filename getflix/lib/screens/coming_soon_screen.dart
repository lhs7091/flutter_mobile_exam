import 'package:flutter/material.dart';

import 'package:getflix/export.dart';
import 'package:provider/provider.dart';

class ComingSoonScreen extends StatefulWidget {
  @override
  _ComingSoonScreenState createState() => _ComingSoonScreenState();
}

class _ComingSoonScreenState extends State<ComingSoonScreen> {
  ComingSoonMovieProvider _comingSoonMovieProvider;
  List<ComingSoonMovie> _comingSoonMovieList;

  var size;
  String pictureUrl = 'https://image.tmdb.org/t/p/w500';

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    // Coming soon movie provider 실행
    _comingSoonMovieProvider = Provider.of<ComingSoonMovieProvider>(context);
    _comingSoonMovieProvider.loadComingSoonMovie();

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
      title: Text('Coming Soon'),
      centerTitle: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.collections_bookmark,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              SizedBox(width: 5.0),
              Container(
                width: 30.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                  image: DecorationImage(
                    image: AssetImage('assets/images/profile.jpeg'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Consumer<ComingSoonMovieProvider>(
          builder: (context, provider, widget) {
        _comingSoonMovieList = provider.getComingSoonMovieList();
        if (_comingSoonMovieList != null && _comingSoonMovieList.length > 0) {
          return Column(
            children: [
              // notification line
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.notifications_none_outlined,
                          color: Colors.white,
                          size: 28.0,
                        ),
                        SizedBox(width: 15.0),
                        Text(
                          'Notification',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              // coming up movie line
              Column(
                children: List.generate(_comingSoonMovieList.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        // image line
                        Container(
                          height: size.height * 0.3,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(pictureUrl +
                                        _comingSoonMovieList[index].posterPath),
                                    fit: BoxFit.cover,
                                  ),
                                  color: Colors.green,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        // title and readme, information line
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // title
                            Flexible(
                              child: Text(
                                _comingSoonMovieList[index].title,
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            // readme and information button
                            Row(
                              children: [
                                Column(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.notifications_none_outlined,
                                        color: Colors.white,
                                        size: 28.0,
                                      ),
                                      onPressed: () {},
                                    ),
                                    Text(
                                      'Remind me',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10.0),
                                Column(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.info_outline,
                                        color: Colors.white,
                                        size: 28.0,
                                      ),
                                      onPressed: () {},
                                    ),
                                    Text(
                                      'Info',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        // upcoming date
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            _comingSoonMovieList[index].releaseDate,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        // description
                        Text(
                          _comingSoonMovieList[index].overview,
                          maxLines: 3,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
