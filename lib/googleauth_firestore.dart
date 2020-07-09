import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GoogleAuthFireStore {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignin = GoogleSignIn();
  final Firestore db = Firestore.instance;

  FirebaseUser currentUser;
  bool loggedIn = false;

  GoogleAuthFireStore() {
    isLoggedIn();
  }

  Future<void> isLoggedIn() async {
    currentUser = await _auth.currentUser();
    currentUser != null ? loggedIn = true : loggedIn = false;
  }

  Future<void> signIn() async {
    final GoogleSignInAccount _signInAccount = await _googleSignin.signIn();
    final GoogleSignInAuthentication _signInAuth =
        await _signInAccount.authentication;

    final AuthCredential credentials = GoogleAuthProvider.getCredential(
        idToken: _signInAuth.idToken, accessToken: _signInAuth.accessToken);

    final AuthResult _authResult =
        await _auth.signInWithCredential(credentials);
    final FirebaseUser user = _authResult.user;
    currentUser = await _auth.currentUser();

    assert(user.uid == currentUser.uid);

    loggedIn = true;

    print('Signin With Google Suceeded with user uid: ${user.uid}');
  }

  void writeDb() async {
    db.collection("Data").document(currentUser.uid).setData({
      "Name": "${currentUser.displayName}",
      "Email:": "${currentUser.email}",
    });
  }

  void modifyDb() async {}

  void deleteDb() async {}

  void readDb() async {}

  void writeRandDb() async {}
}

GoogleAuthFireStore fireBase = GoogleAuthFireStore();
