import 'package:FireStore_GoogleAuth/googleauth_firestore.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  @override
  Widget build(BuildContext build) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Center(
          child: OutlineButton(onPressed: () => fireBase.writeDb()),
        ),
      ),
    );
  }
}
