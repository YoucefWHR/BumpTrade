import 'package:bumptrade/helpers/authenticate.dart';
import 'package:bumptrade/helpers/constants.dart';
import 'package:bumptrade/helpers/helperfunctions.dart';
import 'package:bumptrade/shared/chat_shared/auth.dart';
import 'package:bumptrade/shared/chat_shared/database.dart';
import 'package:bumptrade/widgets/chat/chat.dart';
import 'package:bumptrade/widgets/chat//search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  Stream chatRooms;

  Widget chatRoomsList() {
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

  @override
  void initState() {
    getUserInfogetChats();
    super.initState();
  }

  getUserInfogetChats() async {
    Constants.myName = await HelperFunctions.getUserNameSharedPreference();
    DatabaseMethods().getUserChats(Constants.myName).then((snapshots) {
      setState(() {
        chatRooms = snapshots;
        print(
            "we got the data + ${chatRooms.toString()} this is name  ${Constants.myName}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
       title:  Text("Chat ",
    style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.w700),
            ),
    backgroundColor: Colors.transparent,
        
        elevation: 0.0,
        centerTitle: false,
        actions: [
          GestureDetector(
            onTap: () {
              AuthService().signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Authenticate()));
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(CupertinoIcons.arrow_right_to_line,color: Colors.black,size: 34,) 
                ) 
          )
        ],
       
      ),


      body: Container(
        child: chatRoomsList(),
      ),
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 70.0 ),
     child: FloatingActionButton(
        
        child: Icon(Icons.search),
        backgroundColor: Colors.blueGrey,
    
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Search()));
        },
      ),
      
     ) );
  }
}

class ChatRoomsTile extends StatelessWidget {
  final String userName;
  final String chatRoomId;

  ChatRoomsTile({this.userName,@required this.chatRoomId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Chat(
            chatRoomId: chatRoomId,
          )
        ));
      },
      child: Container(
        color: Colors.lightBlue[100],
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(40)),
              child: Text(userName.substring(0, 1),
                   textAlign: TextAlign.center,
  
                  style: TextStyle(
                      color: Colors.lightBlue[50],
                      fontSize: 40,
                      fontFamily: 'OverpassRegular',
                      fontWeight: FontWeight.w900)),
            ),
            SizedBox(
              width: 18,
            ),
            Text(userName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontFamily: 'OverpassRegular',
                    fontWeight: FontWeight.w700))
          ],
        ),
      ),
    );
  }
}
