import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


import 'package:bumptrade/models/markets/market_active/market_active_model.dart';
import 'package:bumptrade/models/markets/sector_performance/sector_performance_model.dart';
import 'package:bumptrade/standart/market/market_client.dart';

part 'discover_event.dart';
part 'discover_state.dart';

class SectorPerformanceBloc extends Bloc<SectorPerformanceEvent, SectorPerformanceState> {

  @override
  SectorPerformanceState get initialState => SectorPerformanceInitial();

  @override
  Stream<SectorPerformanceState> mapEventToState( SectorPerformanceEvent event ) async* {

    if (event is FetchSectorPerformance) {
      yield SectorPerformanceLoading();
      yield* _fetchData();
    }
  }

  Stream<SectorPerformanceState> _fetchData() async* {
    try {
      final client = MarketClient();

      yield SectorPerformanceLoaded(
        sectorPerformance: await client.fetchSectorPerformance(),
        marketActive: await client.fetchMarketActive(),
        marketGainer: await client.fetchMarketGainers(),
        marketLoser: await client.fetchMarketLosers()
      );
      
    } catch (e, stack) {
     
      yield SectorPerformanceError(message: 'There was an unkwon error');
    }
  }
}
