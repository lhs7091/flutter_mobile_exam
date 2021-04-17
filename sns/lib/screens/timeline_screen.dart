import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sns/export.dart';

class TimelineScreen extends StatefulWidget {
  @override
  _TimelineScreenState createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  final DBController _dbController = Get.put(DBController());
  List<dynamic> users = [];

  @override
  void initState() {
    super.initState();
    _dbController.setUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: 'SNS'),
      body: GetBuilder<DBController>(
        builder: (controller) {
          users = controller.getUsers();
          if (users.length == 0) {
            return linearProgress();
          } else {
            return ListView(
                children: List.generate(users.length, (index) {
              return buildListViewContent(index);
            }));
          }
        },
      ),
    );
  }

  Widget buildListViewContent(int index) {
    return Text(users[index]['username'],
        style: TextStyle(color: Colors.black));
  }
}
