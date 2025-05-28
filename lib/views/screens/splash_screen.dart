import 'package:imthon3/utils/main_util.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (ctx) => Onboarding1()),
      );
    });

    return Scaffold(
      backgroundColor: Appcolors.splashColor,
      body: Center(
        child: Text(
          'Dasturxon',
          style: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
