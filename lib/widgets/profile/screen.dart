import 'package:flutter/material.dart';
import 'package:bumptrade/models/profile/profile.dart';
import 'package:bumptrade/models/storage/storage.dart';

import 'package:bumptrade/shared/colors.dart';
import 'package:bumptrade/widgets/profile/widgets/profile/profile.dart';
import 'package:bumptrade/widgets/profile/widgets/widget/save_button.dart';

class ProfileScreen extends StatelessWidget {

  final bool isSaved;
  final Color color;
  final ProfileModel profile;

  ProfileScreen({
    @required this.isSaved,
    @required this.profile,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        centerTitle: true,
        title: Text(this.profile.stockQuote.symbol),
        

        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(), 
        ),

        actions: <Widget>[
          WatchlistButtonWidget(
            storageModel: StorageModel(
              symbol: profile.stockQuote.symbol, 
              companyName: profile.stockQuote.name
            ),
            isSaved: isSaved,
            color: Colors.white,
          )
        ],
      ),
      
      backgroundColor: Colors.lightBlue[50],
      body: SafeArea(
        child: Profile(
          color: color,
          stockProfile: profile.stockProfile,
          stockChart: profile.stockChart,
          stockQuote: profile.stockQuote,
        ),
        // ProfileNewsScreen(news: profile.stockNews,),
      )
    );
  }
}