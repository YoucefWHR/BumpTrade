import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bumptrade/bloc/profile/profile_bloc.dart';
import 'package:bumptrade/helpers/color/color_helper.dart';
import 'package:bumptrade/helpers/text/text_helper.dart';
import 'package:bumptrade/models/data_overview.dart';
import 'package:bumptrade/shared/styles.dart';
import 'package:bumptrade/widgets/profile/profile.dart';

class PortfolioStockCard extends StatelessWidget {

  final StockOverviewModel data;

  PortfolioStockCard({
    @required this.data
  });

  static const _kCompanyNameStyle = const TextStyle(
    color: Colors.lightBlueAccent,
    fontSize: 20,
    height: 1.5
  );

  static const _kStockTickerSymbol = const TextStyle(
     color: Colors.white,
    fontSize: 25,
    fontWeight: FontWeight.bold
  );

  static const _kStockPriceStyle = const TextStyle(
    color: Colors.white,
     fontSize: 25,
    fontWeight: FontWeight.bold
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: MaterialButton(
        color: Colors.blueGrey,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(flex: 8, child: _buildCompanyData()),
              Expanded(flex: 4,child: _buildPriceData())
            ],
          ),
        ),

        shape: RoundedRectangleBorder(borderRadius: kStandatBorder),
        onPressed: () {

          BlocProvider
            .of<ProfileBloc>(context)
            .add(FetchProfileData(symbol: data.symbol));

          Navigator.push(context, MaterialPageRoute(builder: (_) => Profile(symbol: data.symbol)));
        },
      ),
    );
  }

  
  Widget _buildCompanyData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(data.symbol, style: _kStockTickerSymbol),
        SizedBox(height: 0.0),
        Text(data.name, style: _kCompanyNameStyle,)
      ], 
    );
  }
  
 
  
  Widget _buildPriceData() {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
      
        
        Padding(
            padding: EdgeInsets.only(bottom: 20),
          child: Text(formatText(data.price), 
            textAlign: TextAlign.end, 
            style: _kStockPriceStyle
          ),
        ),

//NQS151786003581
  
        Padding(
          padding: EdgeInsets.only(top: 0),
       
            child: Text(determineTextPercentageBasedOnChange(data.changesPercentage),
            style: TextStyle(color: determineColorBasedOnChange(data.change),fontSize: 20),

          ),
        



        )],
    );
  }
}
