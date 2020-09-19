import 'package:app/resources/firebase_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRepository {
  final _firebaseMethods = FirebaseMethods();

  Future<FirebaseUser> getCurrentUser() => _firebaseMethods.getCurrentUser();

  Future<FirebaseUser> signIn() => _firebaseMethods.signIn();

  Future<void> signOut() => _firebaseMethods.signOut();

  Future<bool> userIsStored(FirebaseUser user) =>
      _firebaseMethods.userIsStored(user);

  Future<void> storeUser(FirebaseUser user) => _firebaseMethods.storeUser(user);
}
