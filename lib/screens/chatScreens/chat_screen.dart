import 'package:chat_master/models/user.dart';
import 'package:chat_master/utils/universal_variables.dart';
import 'package:chat_master/widgets/appbar.dart';
import 'package:chat_master/widgets/custom_tile.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final User reciever;

  const ChatScreen({Key key, this.reciever});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isWriting = false;
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalVariables.blackColor,
      appBar: customAppBar(context),
      body: Column(
        children: <Widget>[
          Flexible(
            child: messageList(),
          ),
          chatControls(),
        ],
      ),
    );
  }

  CustomAppBar customAppBar(context) {
    return CustomAppBar(
        title: Text(widget.reciever.name),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.video_call), onPressed: null),
          IconButton(icon: Icon(Icons.phone), onPressed: null),
        ],
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        centerTitle: false);
  }

  Widget messageList() {
    return ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 6,
        itemBuilder: (context, index) {
          return chatMessageItem();
        });
  }

  Widget chatMessageItem() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Container(
        alignment: Alignment.centerRight,
        child: senderLayout(),
      ),
    );
  }

  Widget senderLayout() {
    Radius messageRadius = Radius.circular(12);

    return Container(
      margin: EdgeInsets.only(top: 12),
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.65),
      decoration: BoxDecoration(
        color: UniversalVariables.senderColor,
        borderRadius: BorderRadius.only(
          topLeft: messageRadius,
          topRight: messageRadius,
          bottomLeft: messageRadius,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "Hello",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget recieverLayout() {
    Radius messageRadius = Radius.circular(12);

    return Container(
      margin: EdgeInsets.only(top: 12),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.65,
      ),
      decoration: BoxDecoration(
        color: UniversalVariables.receiverColor,
        borderRadius: BorderRadius.only(
          topLeft: messageRadius,
          topRight: messageRadius,
          bottomRight: messageRadius,
        ),
      ),
      child: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "Hello",
            style: TextStyle(color: Colors.white, fontSize: 16),
          )),
    );
  }

  Widget chatControls() {
    setWritingTo(bool value) {
      setState(() {
        isWriting = value;
      });
    }

    addMediaModal(context) {
      showModalBottomSheet(
          context: context,
          elevation: 0,
          backgroundColor: UniversalVariables.blackColor,
          builder: (context) {
            return Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: <Widget>[
                      FlatButton(
                          onPressed: () => Navigator.maybePop(context),
                          child: Expanded(
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Content and Tools",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ))
                    ],
                  ),
                ),
                Flexible(
                    child: ListView(children: <Widget>[
                  ModalTile(
                    title: "Media",
                    subtitle: "Share photos and videos",
                    icon: Icons.image,
                  )
                ]))
              ],
            );
          });
    }

    return Container(
      padding: EdgeInsets.all(10),
      child: Row(children: <Widget>[
        GestureDetector(
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              gradient: UniversalVariables.fabGradient,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.add),
          ),
          onTap: () => addMediaModal(context),
        ),
        SizedBox(width: 5),
        Expanded(
          child: TextField(
            controller: textFieldController,
            style: TextStyle(color: Colors.white),
            onChanged: (value) {
              (value.length > 0 && value.trim() != "")
                  ? setWritingTo(true)
                  : setWritingTo(false);
            },
            decoration: InputDecoration(
                hintText: ("Type message here"),
                hintStyle: TextStyle(color: UniversalVariables.greyColor),
                border: OutlineInputBorder(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(50.0)),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                filled: true,
                fillColor: UniversalVariables.separatorColor,
                suffixIcon: GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.face),
                )),
          ),
        ),
        isWriting
            ? Container()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.keyboard_voice),
              ),
        isWriting ? Container() : Icon(Icons.camera_alt),
        isWriting
            ? Container(
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  gradient: UniversalVariables.fabGradient,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.send,
                    size: 17,
                  ),
                ))
            : Container(),
      ]),
    );
  }
}

class ModalTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const ModalTile({
    @required this.title,
    @required this.subtitle,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: CustomTile(
        leading: Container(
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: UniversalVariables.receiverColor,
          ),
          padding: EdgeInsets.all(10),
          child: Icon(
            icon,
            color: UniversalVariables.greyColor,
            size: 38,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: UniversalVariables.greyColor,
            fontSize: 14,
          ),
        ),
        mini: false,
      ),
    );
  }
}
