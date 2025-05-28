import 'package:imthon3/utils/main_util.dart';

class AuthLocalDatasorce {
  final String _key = "my-user-key";

  Future<void> saveAuth(AuthModel authModel) async {
    final prefs = await SharedPreferences.getInstance();
    final data = authModel.copyWith();
    final encoded = jsonEncode(data.toJson());
    await prefs.setString(_key, encoded);
  }

  Future<AuthModel?> getAuth() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs.getString(_key);
      if (data != null) {
        final decoded = jsonDecode(data);
        return AuthModel.fromJson(decoded);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<void> removeAuth() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_key);
    } catch (e) {
      rethrow;
    }
  }
}
