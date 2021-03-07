import 'package:flutter/material.dart';
import 'package:food_bill/data/list_data.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List friends = ListData().friends;
    var profile = ListData().profile;

    return Column(
      children: [
        SizedBox(
          height: size.height * 0.03,
        ),
        Column(
          children: [
            Container(
              width: size.width * 0.35,
              height: size.width * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                    image: NetworkImage(profile['imageUrl']),
                    fit: BoxFit.cover),
              ),
              child: Container(),
            ),
            SizedBox(height: 10.0),
            Text(
              profile['name'],
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              profile['nickName'],
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 80.0, right: 10.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'See Who are going',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 60.0, right: 10.0, bottom: 20.0),
            child: ListView.builder(
              itemCount: friends.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: size.height * 0.1,
                        child: AspectRatio(
                          aspectRatio: 1.2 / 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              image: NetworkImage(friends[index]['imageUrl']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            friends[index]['name'],
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            friends[index]['nickName'],
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            friends[index]['status'],
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                      Icon(
                        friends[index]['check']
                            ? Icons.check_circle_outlined
                            : Icons.cancel_outlined,
                        size: 40.0,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
