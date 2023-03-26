import 'package:paytrybe/locator.dart';
import 'package:paytrybe/ui/base.vm.dart';
import 'package:paytrybe/utils/initializer.dart';

class HomeViewModel extends BaseViewModel {
  Initializer initializer = getIt<Initializer>();

  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
