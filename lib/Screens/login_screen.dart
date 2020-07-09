import 'package:FireStore_GoogleAuth/Screens/main_screen.dart';
import 'package:FireStore_GoogleAuth/googleauth_firestore.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return fireBase.loggedIn
        ? MainScreen()
        : Scaffold(
            body: flag
                ? MainScreen()
                : Container(
                    height: size.height,
                    width: size.width,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Image(
                            image: AssetImage("assets/logo.png"),
                            height: size.height / 3,
                          ),
                          SizedBox(height: 20),
                          _signInButton(),
                        ]),
                  ),
          );
  }

  Widget _signInButton() {
    return OutlineButton(
      borderSide: BorderSide(
        // color: Colors.grey[850],
        width: 0.9,
      ),
      // splashColor: Colors.black,
      onPressed: () => signInStateChange(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image(
              image: AssetImage("assets/google_logo.png"),
              height: 35.0,
            ),
            Padding(padding: const EdgeInsets.only(left: 10)),
            Text(
              'Sign in with Google',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w100,
                // color: Colors.orange[400],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signInStateChange() async {
    await fireBase.signIn();
    setState(() => flag = fireBase.loggedIn);
  }
}
