
import 'package:flutter/material.dart';
import 'package:bumptrade/widgets/search/search.dart';
import 'package:bumptrade/widgets/search/search_box/seach_box.dart';
import 'package:bumptrade/widgets/widgets/baselist.dart';
import 'package:bumptrade/widgets/widgets/header.dart';

class SearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    return BaseList(
      children: [
        StandardHeader(
          title: 'Search',
          action: Container(),
        ),
        // Search Box.
        SizedBox(height:10),
        SearchBoxWidget(),
        SizedBox(height: 16),
        SearchScreenSection()
      ]
      );
  }
}