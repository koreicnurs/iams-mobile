import 'package:dio/dio.dart';

class LanguageRepos {
  final Dio dio;

  LanguageRepos({required this.dio});

  Future<String> changeLanguage(String language) async {
    final response = await dio.put(
      'https://mes-mobile.yorc.org/api/users/change-lang',
      data: {'language': language},
    );
    return response.data['language'];
  }
}
