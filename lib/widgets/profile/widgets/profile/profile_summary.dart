
import 'package:flutter/material.dart';
import 'package:bumptrade/helpers/text/text_helper.dart';

import 'package:bumptrade/models/profile/stock_profile.dart';
import 'package:bumptrade/models/profile/stock_quote.dart';
import 'package:bumptrade/shared/colors.dart';
import 'package:bumptrade/widgets/profile/widgets/styles.dart';

class StatisticsWidget extends StatelessWidget {
  
  final StockQuote quote;
  final StockProfile profile;

  StatisticsWidget({
    @required this.quote,
    @required this.profile
  });

  static Text _renderText(dynamic text) {
    return text != null 
    ? Text(compactText(text))
    : Text('-');
  }
  
  List<Widget> _leftColumn() {
    return [
      ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text('Open', style: subtitleStyle),
        trailing: _renderText(quote.open)
      ),
     
      ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text('Day High', style: subtitleStyle),
        trailing: _renderText(quote.dayHigh)
      ),
      // ListTile(
      //   contentPadding: EdgeInsets.zero,
      //   title: Text('Day Low', style: subtitleStyle),
      //   trailing: _renderText(quote.dayLow)
      // ),
      ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text('52 WK High', style: subtitleStyle),
        trailing: _renderText(quote.yearHigh)
      ),
        ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text('Volume', style: subtitleStyle),
        trailing: _renderText(quote.volume)
      ),
      

    ];
  }

  List<Widget> _rightColumn() {
    return [
 ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text('Close', style: subtitleStyle),
        trailing: _renderText(quote.previousClose)
      ),
       ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text('Day Low', style: subtitleStyle),
        trailing: _renderText(quote.dayLow)
      ),

      ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text('52 WK Low', style: subtitleStyle),
        trailing: _renderText(quote.dayLow)
      ),
       ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text('MKT Cap', style: subtitleStyle),
        trailing: _renderText(quote.marketCap)
      ),
    
    
     
     
    ];
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 16),

        //Text('',style: kProfileScreenSectionTitle),
        SizedBox(height: 8),

        Row(
          children: <Widget>[
            Expanded(
              child: Column(children: _leftColumn()),
            ),

            SizedBox(width: 40),

            Expanded(
              child: Column(children: _rightColumn()),
            )
          ],
        ),
        Divider(),

        

       

        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text('Sector', style: subtitleStyle),
          trailing: Text(displayDefaultTextIfNull(profile.sector)),
        ),
        Divider(),

        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text('Exchange', style: subtitleStyle),
          trailing: Text('${profile.exchange}'),
        ),
        Divider(),

        Text('Information',style: kProfileScreenSectionTitle),
        SizedBox(height: 5),

        Text(profile.description ?? '-',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w300,
            height: 1.7
          ),
        ),
        Divider(),
        
        SizedBox(height: 30),
      ],
    );
  }
}