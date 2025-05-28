import 'package:imthon3/utils/main_util.dart';

class OnboardingWallpaper extends StatelessWidget {
  final void Function()? onPressed;
  const OnboardingWallpaper({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppImages.background, fit: BoxFit.cover),
          Positioned(
            top: 400,
            right: 20,
            left: 20,
            child: SplashList(onPressed: onPressed),
          ),
        ],
      ),
    );
  }
}
