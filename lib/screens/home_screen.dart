import 'package:chat_master/provider/user_provider.dart';
import 'package:chat_master/screens/page_views/chat_list_screen.dart';
import 'package:chat_master/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import 'callScreen/pickup/pickup_layout.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  PageController pageController;
  double _labelFontSize = 10;
  UserProvider userProvider;

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.refreshUser();
    });
    pageController = PageController();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return PickupLayout(
      scaffold: Scaffold(
        backgroundColor: UniversalVariables.blackColor,
        body: PageView(
          children: <Widget>[
            Container(
              child: ChatListScreen(),
            ),
            Center(child: Text("Call Logs")),
            Center(child: Text("Contact Screen")),
          ],
          controller: pageController,
          onPageChanged: onPageChanged,
        ),
        bottomNavigationBar: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: CupertinoTabBar(
              backgroundColor: UniversalVariables.blackColor,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.chat,
                      color: (_page == 0)
                          ? UniversalVariables.lightBlueColor
                          : UniversalVariables.greyColor,
                    ),
                    title: Text("Chats",
                        style: TextStyle(
                          fontSize: _labelFontSize,
                          color: (_page == 0)
                              ? UniversalVariables.lightBlueColor
                              : UniversalVariables.greyColor,
                        ))),

                //2st tab
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.call,
                      color: (_page == 1)
                          ? UniversalVariables.lightBlueColor
                          : UniversalVariables.greyColor,
                    ),
                    title: Text("Call",
                        style: TextStyle(
                          fontSize: _labelFontSize,
                          color: (_page == 1)
                              ? UniversalVariables.lightBlueColor
                              : UniversalVariables.greyColor,
                        ))),

                //3nd Tab
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.contacts,
                      color: (_page == 2)
                          ? UniversalVariables.lightBlueColor
                          : UniversalVariables.greyColor,
                    ),
                    title: Text("Contacts",
                        style: TextStyle(
                          fontSize: _labelFontSize,
                          color: (_page == 2)
                              ? UniversalVariables.lightBlueColor
                              : UniversalVariables.greyColor,
                        ))),
              ],
              onTap: navigationTapped,
              currentIndex: _page,
            ),
          ),
        ),
      ),
    );
  }
}
