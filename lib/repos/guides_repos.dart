import 'package:dio/dio.dart';
import 'package:iamc_flutter/models/guides_model.dart';

class GuidesRepos {
  GuidesRepos({required this.dio});
  final Dio dio;

  Future<GuidesArray> getGuidesRequest() async {
    try {
      final Response response = await dio.get(
        'https://mes-mobile.yorc.org/api/guides/',
      );

      return GuidesArray.fromJson(response.data);
    } catch (e) {
      return GuidesArray(guidesList: []);
    }
  }
}
