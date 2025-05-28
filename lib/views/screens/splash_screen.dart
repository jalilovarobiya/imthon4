import 'package:imthon3/utils/main_util.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   void goToHome(BuildContext context) async {
//     await Future.delayed(Duration(seconds: 3));

//     if (context.mounted) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) {
//             return Onboarding1();
//           },
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     goToHome(context);

//     return Scaffold(
//       backgroundColor: Appcolors.splashColor,
//       body: Center(
//         child: Text(
//           "Dasturxon",
//           style: TextStyle(
//             fontSize: 60,
//             color: Colors.white,
//             fontWeight: FontWeight.w800,
//           ),
//         ),
//       ),
//     );
//   }
// }

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
                          : LoginScreen();
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
