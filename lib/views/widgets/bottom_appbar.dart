import 'package:imthon3/utils/main_util.dart';

class MyBottomAppbar extends StatelessWidget {
  const MyBottomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomViewmodel>(
      builder: (context, model, child) {
        return BottomNavigationBar(
          currentIndex: model.currentIndex,
          onTap: model.changeScreen,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 35),
              label: "main_screen".tr(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag, size: 35),
              label: "card".tr(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message, size: 35),
              label: "chat".tr(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 35),
              label: "my_profile".tr(),
            ),
          ],
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
        );
      },
    );
  }
}
