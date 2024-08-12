import 'package:dio/dio.dart';
import 'package:iamc_flutter/models/news_model.dart';

class NewsRepos {
  NewsRepos({required this.dio});
  final Dio dio;

  Future<NewsResponse> getNewsRequest() async {
    try {
      final Response response = await dio.get(
        'https://mes-mobile.yorc.org/api/news/',
      );

      return NewsResponse.fromJson(response.data);
    } catch (e) {
      return NewsResponse(newsList: []);
    }
  }

  Future<NewsResponse> getNewsByQuery(Map<String, dynamic> queryParameters) async {
    try {
      final Response response = await dio.get(
        'https://mes-mobile.yorc.org/api/news/',
        queryParameters: queryParameters,
      );

      return NewsResponse.fromJson(response.data);
    } catch (e) {
      return NewsResponse(newsList: []);
    }
  }
}
