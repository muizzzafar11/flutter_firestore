import 'package:FireStore_GoogleAuth/googleauth_firestore.dart';
import 'package:flutter/material.dart';
import 'package:FireStore_GoogleAuth/styled_button.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  @override
  Widget build(BuildContext build) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Row 1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // Button 1
              children: <Widget>[
                GestureDetector(
                  child: button(Icons.cloud_upload),
                  onTap: () => fireBase.writeDb(),
                ),
                // Button 2
                GestureDetector(
                  child: button(Icons.edit),
                  onTap: () => fireBase.modifyDb(),
                ),
              ],
            ),
            SizedBox(height: 50),
            // Row 2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Button 3
                GestureDetector(
                  child: button(Icons.send),
                  onTap: () => fireBase.writeRandDb(),
                ),
                // Button 4
                GestureDetector(
                  child: button(Icons.cloud_download),
                  onTap: () => fireBase.readDb(),
                ),
              ],
            ),
            SizedBox(height: 50),
            // Button 5 and Row 3
            GestureDetector(
              child: button(Icons.delete),
              onTap: () => fireBase.deleteDb(),
            ),
          ],
        ),
      ),
    );
  }
}
