import 'package:chat_master/page_views/search_screen.dart';
import 'package:chat_master/resources/firebase_repository.dart';
import 'package:chat_master/screens/home_screen.dart';
import 'package:chat_master/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseRepository _repository = new FirebaseRepository();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat Master",
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        "/search_screen": (context) => SearchScreen(),
      },
      home: FutureBuilder(
        future: _repository.getCurrentUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
