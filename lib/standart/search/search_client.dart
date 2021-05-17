import 'package:dio/dio.dart';
import 'package:sembast/sembast.dart';
import 'package:bumptrade/helpers/database_helper.dart';
import 'package:bumptrade/keys/apiKeys.dart';

import 'package:bumptrade/models/search/search.dart';

class SearchClient {

  final StoreRef<int, Map<String, dynamic>>  _store = intMapStoreFactory.store('search_history');


  Future<Database> get _database async => await DatabaseManager.instance.database;

 
  Future<List<StockSearch>> searchStock({String symbol}) async {

    final Uri uri = Uri.https('www.alphavantage.co', '/query', {
      'function': 'SYMBOL_SEARCH',
      'keywords': symbol,
      'apikey': kAlphaVantageKey
    });

    final response = await Dio().getUri(uri);
    final data = response.data['bestMatches'];

    return StockSearch.convertToList(data);
  }
  
  Future<List<StockSearch>> fetch() async {

    final finder = Finder(sortOrders: [SortOrder(Field.key, false)]);
    final response = await _store.find(await _database, finder: finder);

    return response
    .map((snapshot) => StockSearch(symbol: snapshot.value['symbol'].toString() ))
    .toList();
  }
  
  Future<void> save({String symbol}) async {
    await _store.add(await _database, {'symbol': symbol});
  }

  Future<void> delete({String symbol}) async {
    
    final finder = Finder(filter: Filter.matches('symbol', symbol));
    final response = await _store.findKey(await _database, finder: finder);
    final deleteFinder = Finder(filter: Filter.byKey(response));

    await _store.delete(await _database, finder: deleteFinder);
  }
  
}