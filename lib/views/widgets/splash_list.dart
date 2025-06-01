import 'package:imthon3/utils/main_util.dart';

class SplashList extends StatelessWidget {
  final Widget screen;
  const SplashList({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Appcolors.appOrange,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "We serve incomparable delicacies",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            20.height,
            Text(
              "All the best restaurants with their top menu waiting for you, they cant’t wait for your order!!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            150.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton.appTextButton(
                  contex: context,
                  color: Colors.white,
                  text: "Next",
                  screen: screen,
                ),
                TextButton(
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
                  child: Text("Skip", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
