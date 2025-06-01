import 'package:imthon3/utils/main_util.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.splashColor,
      body: Center(
        child: FutureBuilder(
          future: context.read<AuthViewmodel>().isAuthenticated(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Future.delayed(Duration(seconds: 3), () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) {
                      return snapshot.data == true
                          ? MainScreen()
                          : Onboarding1();
                    },
                  ),
                );
              });
            }
            return Text(
              'Dasturxon',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}
