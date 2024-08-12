import 'package:dio/dio.dart';
import 'package:iamc_flutter/models/alerts_news_model.dart';

class AlertsNewsRepos {
  AlertsNewsRepos({required this.dio});
  final Dio dio;

  Future<AlertsNewsArray> getAlertsNewsRequest() async {
    try {
      final Response response = await dio.get(
        'https://mes-mobile.yorc.org/api/important-alerts/',
      );

      return AlertsNewsArray.fromJson(response.data);
    } catch (e) {
      return AlertsNewsArray(alertsNewsList: []);
    }
  }

  Future<AlertsNewsArray> getAlertsNewsByQuery(Map<String, dynamic> queryParameters) async {
    try {
      final Response response = await dio.get(
        'https://mes-mobile.yorc.org/api/important-alerts/',
        queryParameters: queryParameters,
      );

      return AlertsNewsArray.fromJson(response.data);
    } catch (e) {
      return AlertsNewsArray(alertsNewsList: []);
    }
  }
}
