import 'package:bumptrade/widgets/chat/chatrooms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bumptrade/helpers/authenticate.dart';
import 'package:bumptrade/helpers/constants.dart';
import 'package:bumptrade/helpers/helperfunctions.dart';
import 'package:bumptrade/shared/chat_shared/auth.dart';
import 'package:bumptrade/shared/chat_shared/database.dart';
import 'package:bumptrade/widgets/chat/chat.dart';
import 'package:bumptrade/widgets/chat//search.dart';


Widget chatRoomsList() {
   Stream chatRooms;
    return StreamBuilder(
      stream: chatRooms,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.documents.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ChatRoomsTile(
                    userName: snapshot.data.documents[index].data['chatRoomId']
                        .toString()
                        .replaceAll("_", "")
                        .replaceAll(Constants.myName, ""),
                    chatRoomId: snapshot.data.documents[index].data["chatRoomId"],
                  );
                })
            : Container();
      },
    );
  }


  void initState() {
    getUserInfogetChats();
    initState();
  }

  getUserInfogetChats() async {
    Constants.myName = await HelperFunctions.getUserNameSharedPreference();
    DatabaseMethods().getUserChats(Constants.myName).then((snapshots) {
    });
  }
  Widget appBarMain(BuildContext context) {
    return AppBar(
      title: Text(
        'Conversation',
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
      ),
        
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: false,
    );
  }

  Widget appBarSearch(BuildContext context) {
    return AppBar(
      title: Text(
        "Chat ",
        style: TextStyle(
            color: Colors.black, fontSize: 40, fontWeight: FontWeight.w700),
      ),

      backgroundColor: Colors.transparent,

     
      elevation: 0.0,
      centerTitle: false,
    );
  }

  InputDecoration textFieldInputDecoration(String hintText) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)));
  }

  TextStyle simpleTextStyle() {
    return TextStyle(color: Colors.black, fontSize: 16);
  }

  TextStyle biggerTextStyle() {
    return TextStyle(color: Colors.black, fontSize: 17);
  }

