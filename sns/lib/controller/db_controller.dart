import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DBController extends GetxController {
  final userRef = FirebaseFirestore.instance.collection('users');
  List<dynamic> _users = [];

  getUsers() => _users;

  setUsers() async {
    await userRef.get().then((snapshot) {
      _users = snapshot.docs;
    });
  }
}
