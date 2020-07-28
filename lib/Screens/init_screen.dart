import 'package:flutter/material.dart';
import 'package:FireStore_GoogleAuth/googleauth_firestore.dart';
import 'package:FireStore_GoogleAuth/Screens/login_screen.dart';

class InitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fireBase.dbInit(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return LoginScreen();
          } else {
            return Center(
              child: Image(
                image: AssetImage("assets/logo.png"),
                height: MediaQuery.of(context).size.height / 3,
              ),
            );
          }
        });
  }
}
