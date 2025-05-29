import 'package:imthon3/utils/main_util.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  void navigateNext(BuildContext context) async {
    final isLoggedIn = await context.read<AuthViewmodel>().isAuthenticated();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (ctx) => isLoggedIn ? HomeScreen() : LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingWallpaper(
      onPressed: () => navigateNext(context),
      screen: LoginScreen(),
    );
  }
}
