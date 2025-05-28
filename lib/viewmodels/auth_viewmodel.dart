import 'package:imthon3/utils/main_util.dart';

class AuthViewmodel extends ChangeNotifier {
  final AuthLocalDatasorce authRepository;

  AuthViewmodel({required this.authRepository});

  Future<AuthModel> register({
    required String password,
    required String email,
  }) async {
    final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    print("User=> ${user.user}");
    final authmodel = AuthModel(
      token: user.user!.uid,
      email: email,
      refreshToken: "",
      expiresIn: 0,
      id: user.user!.uid,
    );
    await authRepository.saveAuth(authmodel);
    return authmodel;
  }

  Future<AuthModel> login({
    required String password,
    required String email,
  }) async {
    final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print("User=> ${user.user}");
    final authmodel = AuthModel(
      token: user.user!.uid,
      email: email,
      refreshToken: "",
      expiresIn: 0,
      id: user.user!.uid,
    );
    await authRepository.saveAuth(authmodel);
    return authmodel;
  }

  Future<void> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception("error: $e");
    }
  }

  Future<bool> isAuthenticated() async {
    final auth = await authRepository.getAuth();
    return auth != null;
  }

  Future<void> logOut() async {
    await authRepository.removeAuth();
    notifyListeners();
  }
}
