import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bumptrade/helpers/url/url.dart';
import 'package:bumptrade/shared/colors.dart';
import 'package:bumptrade/widgets/widgets/baselist.dart';
import 'package:bumptrade/helpers/constants.dart';

class Attributions extends StatelessWidget {

  static const _kHeadlineStyle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold
  );

  static const _kTextStyle = const TextStyle(
    color:  kLighterGray,
    height: 1.8,
    fontWeight: FontWeight.w600,
  );

  static const _kSubtitleStyling = const TextStyle(
    color: Color(0XFFb0b0b0),
    fontSize: 18,
    fontWeight: FontWeight.w800
  );

  @override
  Widget build(BuildContext context) {
    return BaseList(
      children: <Widget>[
         _buildContent(
          title: 'Account',
          text: 'Connected as : '+ Constants.myName,
          url: ''
        ),
         Divider(), 
          Divider(),   
        _buildContent(
          title: 'BumpTrade',
          text: 'BumpTrade is an application that is used to have stock prices, informations and graphics. You can add US stocks on your watchlist and search them trough the Search Section. In the Discover Section, you can see the best or the worst performing stocks and sectors. News Section is used to consult news depending of the stocks you have in your watchlist. In the Chat Section you can text with other BumpTraders. ',
          url: ''
        ),
        Divider(),       
      
      ],
    );
  }

  Widget _buildContent({String title, String text, String url}) {
    return GestureDetector(
      onTap: () => launchUrl(url),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: _kHeadlineStyle),
          SizedBox(height: 8),
          Text(text, style: _kTextStyle),
        ],
      ),
    );
  }

  Widget _buildApisContent({String title, String text, String url}) {
    return Padding(
      padding: EdgeInsets.only(bottom:8, top:8),
      child: GestureDetector(
        onTap: () => launchUrl(url),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            
           
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: _kSubtitleStyling),
                  SizedBox(height: 8),
                  Text(text, style: _kTextStyle),
                ],
              )
            )
          ],
        )
      ),
    );
  }
}