import 'package:chat_master/models/user.dart';
import 'package:chat_master/resources/firebase_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRepository {
  FirebaseMethods _firebaseMethods = new FirebaseMethods();
  Future<FirebaseUser> getCurrentUser() => _firebaseMethods.getCurrentUser();

  Future<FirebaseUser> signin() => _firebaseMethods.signIn();

  Future<bool> authenticateUser(FirebaseUser user) =>
      _firebaseMethods.authenticateUser(user);

  Future<void> addDataToDb(FirebaseUser user) =>
      _firebaseMethods.addDataToDb(user);

  Future<void> signOut() => _firebaseMethods.signOut();

  Future<List<User>> fetchAllUsers(FirebaseUser user) => _firebaseMethods.fetchAllUsers(user);
}
