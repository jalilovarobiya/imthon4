import 'package:imthon3/utils/main_util.dart';

class ProfileViewmode extends ChangeNotifier {
  bool isSwitched = false;

  void toggle(bool val) {
    isSwitched = val;
    notifyListeners();
    if (isSwitched) {
      showBasicNotification();
    }
  }
}
