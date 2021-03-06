import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'MainFont',
        brightness: Brightness.dark,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: Image.asset(
                'assets/images/background.jpeg',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 0.0,
                sigmaY: 0.0,
              ),
              child: Container(
                color: Colors.black.withOpacity(0.8),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(height: 20.0),
                    Align(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          'assets/images/album.jpg',
                          width: 250,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Slider(
                      activeColor: Colors.deepOrange,
                      value: _value,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildSubMenu(Icons.add_circle_outline, 'Add'),
                        buildSubMenu(Icons.play_circle_fill_outlined, 'Play'),
                        buildSubMenu(Icons.save_alt_outlined, 'Save'),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          '???????????? ?????? ???????????? ?????? ?????? ???????????? ??????(Kit) ????????? ?????? 1???, 2?????? ???????????? ????????? ?????? ???????????? ?????? 1?????? ???????????? ????????????????????? ????????? ???????????? ????????? ????????????????????? ????????? ?????? ??????.',
                          maxLines: 3,
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Wrap(
                      children: [
                        buildCardWidget(Icons.near_me, '?????????'),
                        buildCardWidget(Icons.near_me, 'English'),
                        buildCardWidget(Icons.near_me, '?????????'),
                        buildCardWidget(Icons.near_me, '?????????'),
                        buildCardWidget(Icons.near_me, 'French'),
                        buildCardWidget(Icons.near_me, 'German'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCardWidget(IconData _icon, String _subTitle) {
    return Card(
      color: Colors.black45,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _icon,
            ),
            Text(_subTitle),
          ],
        ),
      ),
    );
  }

  Widget buildSubMenu(IconData _icon, String _subTitle) {
    return Column(
      children: [
        Icon(
          _icon,
          size: 60.0,
        ),
        Text(
          _subTitle,
          style: TextStyle(fontSize: 20.0),
        ),
      ],
    );
  }
}
