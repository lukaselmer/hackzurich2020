import 'package:app/util/string.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user.dart';

class FirebaseMethods {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
  static final Firestore firestore = Firestore.instance;

  User user = User();

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser currentUser;
    currentUser = await _auth.currentUser();
    return currentUser;
  }

  Future<FirebaseUser> signIn() async {
    final _signInAccount = await _googleSignIn.signIn();
    final _signInAuthentication = await _signInAccount.authentication;

    final credential = GoogleAuthProvider.getCredential(
        accessToken: _signInAuthentication.accessToken,
        idToken: _signInAuthentication.idToken);

    final result = await _auth.signInWithCredential(credential);
    final user = result.user;

    return user;
  }

  Future<void> signOut() async {
    print('signed out start');
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
    return await _auth.signOut();
  }

  Future<bool> userIsStored(FirebaseUser user) async {
    final result = await firestore
        .collection('users')
        .where('email', isEqualTo: user.email)
        .getDocuments();
    return result.documents.isEmpty;
  }

  Future<void> storeUser(FirebaseUser currentUser) async {
    final username = getUsername(currentUser.displayName);

    user = User(
      uid: currentUser.uid,
      email: currentUser.email,
      name: currentUser.displayName,
      profilePhoto: currentUser.photoUrl,
      username: username,
    );

    await firestore
        .collection('users')
        .document(currentUser.uid)
        .setData(user.toMap(user));
  }
}
