import 'package:imthon3/utils/main_util.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingWallpaper(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) {
              return Onboarding3();
            },
          ),
        );
      },
    );
  }
}
