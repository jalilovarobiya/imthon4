import 'package:imthon3/utils/main_util.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  final String _myApiKey = "AIzaSyAUKUOVJ5ybDr086VTKYSMg5djPwSvKHHM";

  Future<AuthModel> register({
    required String password,
    required String email,
  }) async {
    try {
      final uri = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_myApiKey",
      );
      final data = {
        "email": email,
        "password": password,
        "returnSecureToken": true,
      };

      final response = await http.post(uri, body: jsonEncode(data));

      final decoded = jsonDecode(response.body);

      if (decoded["error"] != null) {
        throw decoded["error"]["message"];
      }

      final authmodel = AuthModel.fromJson(decoded);

      return authmodel;
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthModel> login({
    required String password,
    required String email,
  }) async {
    try {
      final uri = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_myApiKey",
      );
      final data = {
        "email": email,
        "password": password,
        "returnSecureToken": true,
      };

      final response = await http.post(uri, body: jsonEncode(data));

      final decoded = jsonDecode(response.body);

      if (decoded["error"] != null) {
        throw decoded["error"]["message"];
      }

      final authmodel = AuthModel.fromJson(decoded);
      return authmodel;
    } catch (e) {
      rethrow;
    }
  }
}
