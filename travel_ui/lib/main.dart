import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                children: [
                  SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Friday, 6 March',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Go to the Vacation',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Please input places',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          color: Colors.blueGrey,
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  AspectRatio(
                    aspectRatio: 1.5 / 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                        image: AssetImage('assets/images/banner.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildCategory('assets/images/camping.jpg', 'Camping'),
                        SizedBox(
                          width: 20,
                        ),
                        buildCategory('assets/images/vacation.jpg', 'Vacation'),
                        SizedBox(
                          width: 20,
                        ),
                        buildCategory('assets/images/camping.jpg', 'Camping'),
                        SizedBox(
                          width: 20,
                        ),
                        buildCategory('assets/images/vacation.jpg', 'Vacation'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.near_me), label: 'plus'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'plus'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'plus'),
          ],
        ),
      ),
    );
  }

  Widget buildCategory(String imageUrl, String title) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1 / 0.7,
              child: FittedBox(
                child: Image.asset(imageUrl),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 10.0),
            Text(title),
          ],
        ),
      ),
    );
  }
}
