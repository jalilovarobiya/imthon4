import 'package:imthon3/utils/main_util.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingWallpaper(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) {
              return Onboarding2();
            },
          ),
        );
      },
      screen: Onboarding2(),
    );
  }
}
