import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sns/export.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  final _formKey = GlobalKey<FormState>();
  String username = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar:
          appBar(context, title: 'Set your profile', removeBackButton: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Center(
                child: Text(
                  'Create a username',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    validator: (String? val) {
                      if (val!.trim().length < 3 || val.isEmpty) {
                        return "username too short";
                      } else if (val.trim().length > 12) {
                        return 'username to long';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (String? val) {
                      if (!(val == null)) {
                        print(val);
                        username = val;
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Username",
                      labelStyle: TextStyle(fontSize: 15),
                      hintText: "Must be at least 3 characters",
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: submit,
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(7.0),
                ),
                child: Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      SnackBar snackBar = SnackBar(content: Text('Welcome $username!'));

      if (_scaffoldKey.currentState != null) {
        _scaffoldKey.currentState!.showSnackBar(snackBar);
      }
      Timer(Duration(seconds: 2), () {
        Navigator.pop(context, username);
      });
    }
  }
}
