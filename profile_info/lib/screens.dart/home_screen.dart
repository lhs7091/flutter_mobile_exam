import 'package:flutter/material.dart';
import 'package:profile_info/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  Size size;
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontSize: 30.0),
        ),
        backgroundColor: blackColor,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
      endDrawer: Container(
        width: 200,
        height: double.infinity,
        color: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            // profile picture and my description
            buildProfileInfo(),
            SizedBox(height: 20.0),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.article_outlined,
                      color: fontColor,
                      size: 35,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '50',
                      style: TextStyle(color: fontColor, fontSize: 25),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.thumb_up_outlined,
                      color: fontColor,
                      size: 35,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '50',
                      style: TextStyle(color: fontColor, fontSize: 25),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.share_outlined,
                      color: fontColor,
                      size: 35,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '50',
                      style: TextStyle(color: fontColor, fontSize: 25),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildElevatedButton('Follow', false),
                SizedBox(width: size.width * 0.1),
                buildElevatedButton('Message', true),
              ],
            ),
            SizedBox(height: 20),
            // Tab bar
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  icon: Icon(Icons.directions_car),
                ),
                Tab(
                  icon: Icon(Icons.directions_transit),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.network(
                          'https://cdn.pixabay.com/photo/2020/11/26/15/28/woman-5779323__480.jpg',
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                  Image.asset('assets/images/profile.jpeg')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButton(String text, bool isBorder) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.grey[700],
        minimumSize: Size(size.width * 0.35, size.height * 0.05),
        side: isBorder ? BorderSide(color: Colors.white) : null,
      ),
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(fontSize: 25.0, letterSpacing: 2.0),
      ),
    );
  }

  Widget buildProfileInfo() {
    return Row(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.black,
          child: CircleAvatar(
            radius: 58,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 56,
              backgroundImage: AssetImage('assets/images/profile.jpeg'),
            ),
          ),
        ),
        SizedBox(width: 20.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'LEE',
                style: TextStyle(
                  color: fontColor,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10.0),
              Text(
                'Programmer',
                style: TextStyle(color: fontColor, fontSize: 15.0),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10.0),
              Text(
                'To be a Great Programmer',
                style: TextStyle(color: fontColor, fontSize: 20.0),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
