import 'package:flutter/material.dart';
import 'package:bumptrade/helpers/color/color_helper.dart';
import 'package:bumptrade/helpers/text/text_helper.dart';
import 'package:bumptrade/models/profile/stock_chart.dart';
import 'package:bumptrade/models/profile/stock_profile.dart';
import 'package:bumptrade/models/profile/stock_quote.dart';

import 'package:bumptrade/widgets/profile/widgets/profile/profile_graph.dart';
import 'package:bumptrade/widgets/profile/widgets/profile/profile_summary.dart';

import 'package:bumptrade/widgets/profile/widgets/styles.dart';

class Profile extends StatelessWidget {

  final Color color;
  final StockQuote stockQuote;
  final StockProfile stockProfile;
  final List<StockChart> stockChart;

  Profile({
    @required this.color,
    @required this.stockProfile,
    @required this.stockQuote,
    @required this.stockChart,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(left: 26, right: 26, top: 26),
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(this.stockQuote.name ?? '-', style: kProfileCompanyName,),

            _buildPrice(),
            
            Container(
              height: 250,
              padding: EdgeInsets.only(top: 26),
              child: SimpleTimeSeriesChart(
                chart: this.stockChart,
                color: this.color
              )
            ),

            StatisticsWidget(
              quote: stockQuote,
              profile: stockProfile,
            )
          ],
        ),
      ],
    );
  }

  Widget _buildPrice() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('\$${formatText(stockQuote.price)}', style: priceStyle, ),
          SizedBox(height: 9),
          Text('${determineTextBasedOnChange(stockQuote.change)}  (${determineTextPercentageBasedOnChange(stockQuote.changesPercentage)})', 
            style: determineTextStyleBasedOnChange(stockQuote.change)
          )
        ],
      ),
    );
  }
}