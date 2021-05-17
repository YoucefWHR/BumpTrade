import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:bumptrade/widgets/discover/discoverSection.dart';
import 'package:bumptrade/widgets/news/news_section.dart';
import 'package:bumptrade/widgets/portfolio/watchlist.dart';
import 'package:bumptrade/widgets/search/search_section.dart';
import 'package:bumptrade/widgets/chat/mainofchat.dart';

class StockMarketAppHome extends StatefulWidget {
  @override
  _StockMarketAppHomeState createState() => _StockMarketAppHomeState();
}

class _StockMarketAppHomeState extends State<StockMarketAppHome> {
  

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            backgroundColor: Colors.black87,
            iconSize: 30,
            items: [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home, color: Colors.white),
                label: "HOME",
              ),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.search, color: Colors.white),
                  label: "SEARCH"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.chat_bubble, color: Colors.white),
                  label: "CHAT"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.chart_bar_alt_fill,
                      color: Colors.white),
                  label: "DISCOVER"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.news, color: Colors.white),
                  label: "NEWS"),
            ]),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return PortfolioSection();
              break;
            case 1:
              return SearchSection();
              break;
            case 2:
              return ChatSection();
              break;

            case 3:
              return DiscoverSection();
              break;

            case 4:
              return NewsSection();
              break;

            default:
              return PortfolioSection();
          }
        });
  }

  
}
