import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:sns/export.dart';
import 'package:sns/model/user_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  late PageController _pageController;
  final userRef = FirebaseFirestore.instance.collection('users');
  final DateTime timestamp = DateTime.now();
  late User currentUser;

  int pageIndex = 0;

  bool isAuth = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // google sign in
    _googleSignIn.onCurrentUserChanged.listen((account) {
      googleHandleSignin(account);
    }, onError: (err) {
      print('Error sign in : $err');
    });

    // google re-authenticate user when app is opened
    _googleSignIn.signInSilently(suppressErrors: false).then((account) {
      googleHandleSignin(account);
    }).catchError((err) {
      print('Error re-sign in: $err');
    });

    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  buildAuthScreen() {
    return Scaffold(
      body: PageView(
        children: [
          // TimelineScreen(),
          ElevatedButton(onPressed: googleLogout, child: Text('Logout')),
          ActivityFeedScreen(),
          UploadScreen(),
          SearchScreen(),
          ProfileScreen(),
        ],
        controller: _pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: pageIndex,
        onTap: (pageIndex) {
          _pageController.animateToPage(
            pageIndex,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        },
        activeColor: Colors.deepPurple,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_active)),
          BottomNavigationBarItem(icon: Icon(Icons.photo_camera, size: 35.0)),
          BottomNavigationBarItem(icon: Icon(Icons.search)),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle)),
        ],
      ),
    );
  }

  buildUnAuthScreen() {
    return Scaffold(
      body: Container(
        decoration: buildBackGround(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Flutter SNS',
              style: TextStyle(
                fontFamily: "Signatra",
                fontSize: 70.0,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: gooleLogin,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/btn_google_dark_normal_ios.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 50),
                GestureDetector(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/email.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildBackGround() {
    return BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(
            'https://images.unsplash.com/photo-1525098158261-13fc4d14ff09?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=975&q=80'),
        fit: BoxFit.cover,
      ),
    );
  }

  gooleLogin() {
    _googleSignIn.signIn();
  }

  googleLogout() {
    _googleSignIn.signOut();
  }

  googleHandleSignin(GoogleSignInAccount? account) {
    if (account != null) {
      createUserInFirestore();
      setState(() {
        isAuth = true;
      });
    } else {
      setState(() {
        isAuth = false;
      });
    }
  }

  createUserInFirestore() async {
    // check if user exists in users collection in db
    final GoogleSignInAccount user = _googleSignIn.currentUser!;
    DocumentSnapshot doc = await userRef.doc(user.id).get();
    String username = "";

    //　user doesn't exist. take them to create account page
    if (!doc.exists) {
      username = await Navigator.push(
          context, MaterialPageRoute(builder: (context) => CreateAccount()));

      // get username from create account, use it to make new user doc
      userRef.doc(user.id).set({
        "id": user.id,
        "username": username,
        "photoUrl": user.photoUrl,
        "email": user.email,
        "displayName": user.displayName,
        "bio": "",
        "timestamp": timestamp,
      });

      doc = await userRef.doc(user.id).get();
    }

    currentUser = User.fromDocumnet(doc);
    print(currentUser);
    print(currentUser.username);
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }
}
