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
    dbInit();
  }

  Future<void> dbInit() async {
    // loggedIn = await _googleSignin.isSignedIn();
    // if (loggedIn) {
    //   currentUser = await _auth.currentUser();
    // }
    loggedIn = await _googleSignin.isSignedIn();
    await _googleSignin.isSignedIn()
        ? currentUser = await _auth.currentUser()
        : await signIn();
  }

  Future<void> signIn() async {
    if (await _googleSignin.isSignedIn() == false) {
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
  }

  void writeDb() async {
    db.collection("Data").document(currentUser.uid).setData({
      "Name:": "${currentUser.displayName}",
      "Email:": "NoEmail@example.com",
      "photoURL:": "${currentUser.photoUrl}",
      "phone Number:": "No Phone Number",
    });
  }

  void modifyDb() async {
    db.collection("Data").document(currentUser.uid).updateData({
      "Online:": loggedIn,
      "Name:": "Modified Name",
      "Email:": "Modified.email@example.com",
    });
  }

  void deleteDb() async {
    db.collection("Data").document(currentUser.uid).delete();
  }

  void readDb() async {
    db.collection("Data").getDocuments().then((snapshot) =>
        snapshot.documents.forEach((result) => print(result.data)));
  }

  void writeRandDb() async {
    db.collection("Data").add({
      "name": "john",
      "age": 50,
      "email": "example@example.com",
      "address": {
        "street": "street 24",
        "city": "new york",
      }
    });

    db.collection("Data").add({
      "name:": "John",
      "hobbies:": FieldValue.arrayUnion([
        "programming",
        "exercise",
        "reading",
      ]),
    });
  }
}

GoogleAuthFireStore fireBase = GoogleAuthFireStore();
