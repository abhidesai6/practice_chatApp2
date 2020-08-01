import 'dart:io';

import 'package:chat_master/models/message.dart';
import 'package:chat_master/models/user.dart';
import 'package:chat_master/provider/image_upload_provider.dart';
import 'package:chat_master/resources/firebase_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseRepository {
  FirebaseMethods _firebaseMethods = new FirebaseMethods();
  Future<FirebaseUser> getCurrentUser() => _firebaseMethods.getCurrentUser();

  Future<FirebaseUser> signin() => _firebaseMethods.signIn();

  Future<bool> authenticateUser(FirebaseUser user) =>
      _firebaseMethods.authenticateUser(user);

  Future<void> addDataToDb(FirebaseUser user) =>
      _firebaseMethods.addDataToDb(user);

  Future<void> signOut() => _firebaseMethods.signOut();

  Future<List<User>> fetchAllUsers(FirebaseUser user) =>
      _firebaseMethods.fetchAllUsers(user);

  Future<void> addMessageToDb(Message message, User sender, User receiver) =>
      _firebaseMethods.addMessageToDb(message, sender, receiver);

  void uploadImage(
      {@required File image,
      @required String receiverId,
      @required String senderId,
      @required ImageUploadProvider imageUploadProvider}) {
    _firebaseMethods.uploadImage(
      image,
      receiverId,
      senderId,
      imageUploadProvider,
    );
  }
}
