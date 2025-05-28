import 'package:imthon3/utils/main_util.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingWallpaper(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) {
              return LoginScreen();
            },
          ),
        );
      },
    );
  }
}
