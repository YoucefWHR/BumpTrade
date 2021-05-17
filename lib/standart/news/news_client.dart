import 'package:dio/dio.dart';

import 'package:bumptrade/helpers/http_helper.dart';
import 'package:bumptrade/keys/apiKeys.dart';
import 'package:bumptrade/models/news/news.dart';
import 'package:bumptrade/models/news/single_new_model.dart';

class NewsClient extends FetchClient {

  Future<NewsDataModel> fetchNews({String ticker}) async {

    final Uri newsUri = Uri.https('newsapi.org', '/v2/everything', {
      'q': '"$ticker"',
      'language': 'en',
      'sortBy': 'finance',
      'pageSize': '3',
      'apikey': kNewsKey
    });

    final Response<dynamic> newsResponse = await super.fetchData(uri: newsUri);
    final List<SingleNewModel> newsOverviews = SingleNewModel.toList(newsResponse.data['articles']);

    return NewsDataModel(
      keyWord: ticker,
      news: newsOverviews,
    );
  }
}