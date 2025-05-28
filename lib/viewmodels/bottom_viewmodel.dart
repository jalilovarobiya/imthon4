import 'package:imthon3/utils/main_util.dart';

class BottomViewmodel extends ChangeNotifier {
  int currentIndex = 0;

  void changeScreen(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
