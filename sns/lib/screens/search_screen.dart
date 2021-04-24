import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sns/model/user_model.dart';
import 'package:sns/widgets/progress_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final userRef = FirebaseFirestore.instance.collection('users');
  TextEditingController searchController = TextEditingController();
  bool hasSearch = false;
  String query = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSearchField(),
      body: hasSearch ? buildSearchResults() : buildNoContent(),
    );
  }

  AppBar buildSearchField() {
    return AppBar(
      title: TextFormField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search for a user....',
          filled: true,
          prefixIcon: Icon(
            Icons.account_box,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.clear,
            ),
            onPressed: () {
              searchController.clear();
            },
          ),
        ),
        onFieldSubmitted: (val) {
          setState(() {
            query = val;
            hasSearch = true;
          });
        },
      ),
    );
  }

  Widget buildSearchResults() {
    print('buildSearchResults');
    return FutureBuilder<QuerySnapshot>(
        future: handleSearch(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          }
          List<UserResult> searchResults = [];
          snapshot.data!.docs.forEach((element) {
            searchResults.add(UserResult(User.fromDocumnet(element)));
          });
          return ListView(
            children: searchResults,
          );
        });
  }

  Widget buildNoContent() {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      padding: EdgeInsets.all(10),
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Image.asset(
              "assets/images/not-applicable.png",
              height: orientation == Orientation.portrait ? 300 : 150,
              scale: 0.5,
            ),
            Text(
              "Find Users",
              textAlign: TextAlign.center,
              style: GoogleFonts.alegreyaSans(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 60,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<QuerySnapshot> handleSearch() {
    print(query);
    Future<QuerySnapshot> users =
        userRef.where("displayName", isGreaterThanOrEqualTo: query).get();

    return users;
  }
}

class UserResult extends StatelessWidget {
  final User user;

  UserResult(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.2),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              print('tapped');
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(user.photoUrl),
              ),
              title: Text(user.displayName),
              subtitle: Text(user.username),
            ),
          ),
          Divider(
            height: 2.0,
            color: Colors.white54,
          ),
        ],
      ),
    );
  }
}
