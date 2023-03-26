import 'package:paytrybe/utils/string-extensions.dart';

class NavigationModel {
  const NavigationModel(this.index, this.title, this.icon, this.activeIcon);
  final int index;
  final String title;
  final String icon;
  final String activeIcon;
}

List<NavigationModel> navigationModel = <NavigationModel>[
  NavigationModel(0, 'Home', "home".svg, "nav_home_active".svg),
  NavigationModel(
      1, 'Transactions', "transactions".svg, "nav_transactions_active".svg),
  NavigationModel(2, 'Cards', "cards".svg, "nav_refferral_active".svg),
  NavigationModel(3, 'Settings', "settings".svg, "nav_profile_active".svg),
];
