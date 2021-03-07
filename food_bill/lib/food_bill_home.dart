import 'package:flutter/material.dart';
import 'package:food_bill/pages/food_item_page.dart';
import 'package:food_bill/pages/friends_page.dart';

class FoodBillHomePage extends StatefulWidget {
  @override
  _FoodBillHomePageState createState() => _FoodBillHomePageState();
}

class _FoodBillHomePageState extends State<FoodBillHomePage> {
  int _navTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Side Menu
            Positioned(
              left: 0,
              top: 0,
              child: buildSideMenuBar(),
            ),
            // Profile
            Positioned(
              right: 8,
              top: 0,
              child: Text(
                "PROFILE",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Food Item page
            getPages(),
          ],
        ),
      ),
    );
  }

  getPages() {
    switch (_navTabIndex) {
      case 0:
        {
          return Positioned(
            top: 24,
            right: 8,
            left: 64,
            child: Center(child: Text("We're going")),
          );
        }
        break;

      case 1:
        {
          return FoodItemPage();
        }
        break;

      case 2:
        {
          return Positioned(
            top: 24,
            right: 8,
            left: 64,
            child: Center(child: Text('Total Bills Page')),
          );
        }
        break;

      case 3:
        {
          return FriendsPage();
        }

      default:
        {
          return Positioned(
            top: 24,
            right: 8,
            left: 64,
            child: Center(child: Text('default')),
          );
        }
        break;
    }
  }

  Widget buildSideMenuBar() {
    return Container(
      width: 48,
      height: MediaQuery.of(context).size.height / 1.4,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          buildSideMenu("WE'RE GOING", 0),
          buildSideMenu("FOOD ITEM", 1),
          buildSideMenu("TOTAL BILLS", 2),
          buildSideMenu("FRIENDS", 3),
        ],
      ),
    );
  }

  Widget buildSideMenu(String _title, int navTab) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _navTabIndex = navTab;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: _navTabIndex == navTab ? Colors.black : Colors.white,
            border: Border.all(
              color: Colors.grey[400],
            ),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: Center(
            child: RotatedBox(
              quarterTurns: 1,
              child: Text(
                _title,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: _navTabIndex == navTab ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
