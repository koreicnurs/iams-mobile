import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iamc_flutter/models/auth_token_model.dart';

class AuthRepos {
  AuthRepos({required this.dio});
  final Dio dio;

  Future<void> sendPostRequest({required String number}) async {
    const storage = const FlutterSecureStorage();
    try {
      final response = await dio.post(
        'https://mes-mobile.yorc.org/api/users/auth',
        data: {'number': number},
      );

      final AuthToken result = AuthToken.fromJson(response.data);

      await storage.write(key: "token", value: result.token);

    } catch (e) {
      // print('Error: $e');
    }
  }
}


