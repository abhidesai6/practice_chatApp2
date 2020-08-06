import 'package:chat_master/models/call.dart';
import 'package:chat_master/resources/call_methods.dart';
import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  final Call call;
  const CallScreen({@required this.call});
  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  final CallMethods callMethods = CallMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("callhas been made"),
            MaterialButton(
                color: Colors.red,
                child: Icon(Icons.call_end, color: Colors.white),
                onPressed: () {
                  callMethods.endCall(call: widget.call);
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
