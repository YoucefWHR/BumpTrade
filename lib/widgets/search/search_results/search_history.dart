

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bumptrade/bloc/profile/profile_bloc.dart';
import 'package:bumptrade/bloc/search/search_bloc.dart';
import 'package:bumptrade/models/search/search.dart';
import 'package:bumptrade/widgets/profile/profile.dart';
import 'package:flutter/cupertino.dart';

class SearchHistoryWidget extends StatelessWidget {

  final StockSearch search;

  SearchHistoryWidget({
    @required this.search
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(CupertinoIcons.back),
      title: Text(search.symbol),

      onTap: () {
        Navigator
        .push(context, MaterialPageRoute(builder: (_) => Profile(symbol: search.symbol)));
        
        BlocProvider
        .of<ProfileBloc>(context)
        .add(FetchProfileData(symbol: search.symbol));
      },

      trailing: IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        icon: Icon(Icons.clear), 
        color: Colors.red,
        
        onPressed: () {
          BlocProvider
          .of<SearchBloc>(context)
          .add(DeleteSearch(symbol: search.symbol));
        }
      )
    );
  }
}