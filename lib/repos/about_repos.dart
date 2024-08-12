import 'package:dio/dio.dart';
import 'package:iamc_flutter/models/about_model.dart';

class AboutRepos {
  AboutRepos({required this.dio});
  final Dio dio;

  Future<AboutModel> getAboutRequest() async {
    try {
      final Response response = await dio.get(
        'https://mes-mobile.yorc.org/api/about/',
      );

      return AboutModel.fromJson(response.data);
    } catch (e) {
      return AboutModel();
    }
  }
}
