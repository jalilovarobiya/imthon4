import 'package:imthon3/utils/main_util.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(),
      CartScreen(),
      ChatList(),
      ProfileScreen(),
    ];
    return Scaffold(
      body: Consumer<BottomViewmodel>(
        builder: (context, model, child) {
          return screens[model.currentIndex];
        },
      ),
      bottomNavigationBar: MyBottomAppbar(),
    );
  }
}
