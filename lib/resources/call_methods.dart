import 'package:chat_master/constants/strings.dart';
import 'package:chat_master/models/call.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CallMethods {
  final CollectionReference callCollection =
      Firestore.instance.collection(CALL_COLLECTION);

  Future<bool> makeCall({Call call}) async {
    try {
      call.hasDialled = true;
      Map<String, dynamic> hasDialledMap = call.toMap(call);
      call.hasDialled = false;
      Map<String, dynamic> hasNotDialledMap = call.toMap(call);

      await callCollection.document(call.callerId).setData(hasDialledMap);
      await callCollection.document(call.receiverId).setData(hasNotDialledMap);
      return true;
    } catch (e) {
      print(e);
      return false;
    }

    Future<bool> endCall
  }
}
