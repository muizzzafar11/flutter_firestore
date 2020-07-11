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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Button 1
            FloatingActionButton(
              onPressed: () => fireBase.writeDb(),
              child: Icon(Icons.cloud_upload),
            ),
            // Button2
            FloatingActionButton(
              onPressed: () => fireBase.modifyDb(),
              child: Icon(Icons.edit),
            ),
            // Button 3
            FloatingActionButton(
              onPressed: () => fireBase.deleteDb(),
              child: Icon(Icons.delete),
            ),
            // Button 4
            FloatingActionButton(
              onPressed: () => fireBase.writeRandDb(),
              child: Icon(Icons.send),
            ),
            // Button 5
            FloatingActionButton(
              onPressed: () => fireBase.readDb(),
              child: Icon(Icons.cloud_download),
            ),
          ],
        ),
      ),
    );
  }
}
