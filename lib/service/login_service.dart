import 'package:dio/dio.dart';
import '../helpers/user_info.dart';

class LoginService {
  final Dio _dio = Dio();

  Future<bool> login(String username, String password) async {
    try {
      final response = await _dio.get(
        'https://6663002762966e20ef0aeb25.mockapi.io/users',
        queryParameters: {
          'username': username,
          'password': password,
        },
      );

      if (response.data.isNotEmpty) {
        final user = response.data[0];
        await UserInfo().setToken(
            "dummy_token"); // Anda mungkin ingin menggunakan token sesungguhnya
        await UserInfo().setUserID(user['id']);
        await UserInfo().setUsername(user['username']);
        return true;
      }

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
