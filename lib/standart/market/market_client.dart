import 'package:dio/dio.dart';

import 'package:bumptrade/helpers/http_helper.dart';

import 'package:bumptrade/models/markets/market_active/market_active_model.dart';
import 'package:bumptrade/models/markets/sector_performance/sector_performance_model.dart';

class MarketClient extends FetchClient {

  
  Future<SectorPerformanceModel> fetchSectorPerformance() async {

    final Response<dynamic> response = await super.fetchData(
      uri: Uri.https('www.alphavantage.co', '/query', {
        'function': 'SECTOR',
        'apikey': 'demo'
      })
    );

    return SectorPerformanceModel(
      performanceModelToday: SectorPerformanceDataModel.fromJson(response.data['Rank A: Real-Time Performance']),
    );
  }

  
  Future<MarketMoversModelData> fetchMarketActive() async {
    final Response<dynamic> stock = await super.financialModelRequest('/api/v3/stock/actives');
    return MarketMoversModelData(
      marketActiveModelData: MarketMoversModelData.toList(stock.data['mostActiveStock'])
    );
  }

  
  Future<MarketMoversModelData> fetchMarketGainers() async {
    final Response<dynamic> response = await super.financialModelRequest('/api/v3/stock/gainers');
    return MarketMoversModelData(
      marketActiveModelData: MarketMoversModelData.toList(response.data['mostGainerStock'])
    );
  }

 
  Future<MarketMoversModelData> fetchMarketLosers() async {
    final Response<dynamic> response = await super.financialModelRequest('/api/v3/stock/losers');
    return MarketMoversModelData(
      marketActiveModelData: MarketMoversModelData.toList(response.data['mostLoserStock'])
    );
  }
}