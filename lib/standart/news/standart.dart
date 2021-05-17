
import 'package:bumptrade/models/news/news.dart';
import 'package:bumptrade/standart/news/news_client.dart';

class NewsRepository extends NewsClient {
  
  Future<NewsDataModel> fetchNews({String ticker}) async {
    return await super.fetchNews(ticker: ticker);
  }

}