import 'package:dio/dio.dart';
import 'package:iamc_flutter/models/user_get_me_model.dart';

class UserGetMeRepos {
  UserGetMeRepos({required this.dio});
  final Dio dio;

  Future<UserGetMe> getMeRequest() async {
    try {
      final Response response = await dio.get(
        'https://mes-mobile.yorc.org/api/users/auth',
      );

      return UserGetMe.fromJson(response.data);
    } catch (e) {
      return UserGetMe();
    }
  }
}
