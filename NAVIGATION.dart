import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bumptrade/PAGE2.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: CupertinoTabScaffold(
      tabBar:
          CupertinoTabBar(backgroundColor: Colors.black87, iconSize: 35, items: [
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Icon(CupertinoIcons.home),
          ),
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Icon(CupertinoIcons.search),
          ),
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Icon(CupertinoIcons.chat_bubble_text),
          ),
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Icon(CupertinoIcons.chart_bar_alt_fill),
          ),
        ),
      ]),
      tabBuilder: (context, index) {
        return CupertinoTabView(builder: (context) {
          switch (index) {
            case 0:
              return Page1();
              break;
            case 1:
              return Page2();
              break;
          }
        });
      },
    ));
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextField(
          decoration: InputDecoration(labelText: "STOCKS:"),
        ),
      )),
    );
  }
}
