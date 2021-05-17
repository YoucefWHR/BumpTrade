import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bumptrade/bloc/discover/discover_bloc.dart';
import 'package:bumptrade/models/markets/market_active/market_active_model.dart';
import 'package:bumptrade/models/markets/sector_performance/sector_performance_model.dart';

import 'package:bumptrade/shared/colors.dart';
import 'package:bumptrade/shared/styles.dart';

import 'package:bumptrade/widgets/discover/discover_top.dart';
import 'package:bumptrade/widgets/discover/discover_performance.dart';

import 'package:bumptrade/widgets/widgets/screenMessage.dart';
import 'package:bumptrade/widgets/widgets/loading_indicator.dart';

class MarketsPerformance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectorPerformanceBloc, SectorPerformanceState>(
        builder: (BuildContext context, SectorPerformanceState state) {
      if (state is SectorPerformanceInitial) {
        BlocProvider.of<SectorPerformanceBloc>(context)
            .add(FetchSectorPerformance());
      }

      if (state is SectorPerformanceError) {
        return Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
          child: EmptyScreen(message: state.message),
        );
      }

      if (state is SectorPerformanceLoaded) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //SectorPerformance(performanceData: state.sectorPerformance),

         
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text('Top Gainers ▲', style: TextStyle(color: Colors.green[900],fontWeight: FontWeight.w800,fontSize: 24)),
          ),
          _buildMarketMovers(stonks: state.marketGainer, color: PositiveColor),

          Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Text('Top Losers ▼ ', style: TextStyle(color: Colors.red,fontWeight: FontWeight.w800,fontSize: 24)),
          ),
          _buildMarketMovers(stonks: state.marketLoser, color: Colors.red),
         
           Padding(
            padding: EdgeInsets.only(top: 10, bottom: 8),
            child: Text('Most Active ⦿ ', style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w800,fontSize: 24)),
          ),
          _buildMarketMovers(
              stonks: state.marketActive, color: Colors.blueGrey),

          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 0),
            child: Text('Sectors 🏦 ', style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w800,fontSize: 30)),
          ),
 
        Padding(
      padding: EdgeInsets.only(right: 0,top: 20),
      child: Container(
        child:  SectorPerformance(performanceData: state.sectorPerformance),
        width: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.blueGrey[400],
        ),
      )
    ),

         // SectorPerformance(performanceData: state.sectorPerformance),
         
        ]);
      }

      return Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
        child: LoadingIndicatorWidget(),
      );
    });
  }

  Widget _buildMarketMovers({MarketMoversModelData stonks, Color color}) {
    return Container(
      height: 80,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 10),
          scrollDirection: Axis.horizontal,
          itemCount: stonks.marketActiveModelData.length,
          itemBuilder: (BuildContext context, int index) => MarketMovers(
                data: stonks.marketActiveModelData[index],
                color: color,
              )),
    );
  }
}
