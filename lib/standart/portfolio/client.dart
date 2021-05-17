import 'package:dio/dio.dart';
import 'package:bumptrade/helpers/http_helper.dart';
import 'package:bumptrade/models/data_overview.dart';
import 'package:bumptrade/models/profile/market_index.dart';

class PortfolioClient extends FetchClient {

  Future<List<MarketIndexModel>> fetchIndexes() async {
    final Response<dynamic> response = await super.financialModelRequest('/api/v3/quote/^DJi');
    return MarketIndexModel.toList(response.data);
  }

  Future<StockOverviewModel> fetchStocks({String symbol}) async {
    final Response<dynamic> response = await super.financialModelRequest('/api/v3/quote/$symbol');
    return StockOverviewModel.fromJson(response.data[0]);
  }
  }