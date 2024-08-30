import 'package:dio/dio.dart';

class RegisterService {
  final Dio _dio = Dio();

  Future<bool> register(String username, String password) async {
    try {
      final response = await _dio.post(
        'https://6663002762966e20ef0aeb25.mockapi.io/users',
        data: {
          'username': username,
          'password': password,
        },
      );

      return response.statusCode == 201; // Berhasil registrasi jika status 201
    } catch (e) {
      print(e);
      return false;
    }
  }
}
