import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paytrybe/constant/palette.dart';
import 'package:paytrybe/ui/base.ui.dart';
import 'package:paytrybe/ui/cards/cards.ui.dart';
import 'package:paytrybe/ui/home/home.ui.dart';
import 'package:paytrybe/ui/home/home.vm.dart';
import 'package:paytrybe/ui/home/nav_model.dart';
import 'package:paytrybe/ui/settings/settings.ui.dart';
import 'package:paytrybe/ui/transactions/transactions.ui.dart';
import 'package:paytrybe/utils/widget_extensions.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({
    Key? key,
  }) : super(key: key);

  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        builder: (context, model, child) => Scaffold(
              resizeToAvoidBottomInset: false,
              bottomNavigationBar: BottomAppBar(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: navigationModel
                          .map(
                            (e) => InkWell(
                              highlightColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    e.icon,
                                    color: e.index == model.selectedIndex
                                        ? primaryColor
                                        : null,
                                  ),
                                  4.0.sbH,
                                  Text(
                                    e.title,
                                    style: TextStyle(
                                        color: e.index == model.selectedIndex
                                            ? primaryColor
                                            : textLight,
                                        fontSize: 12,
                                        fontWeight:
                                            e.index == model.selectedIndex
                                                ? FontWeight.bold
                                                : FontWeight.w500),
                                  )
                                ],
                              ),
                              onTap: () => model.onItemTapped(e.index),
                            ),
                          )
                          .toList()),
                ),
              ),
              body: Container(
                child: <Widget>[
                  const HomePage(),
                  const TransactionsPage(),
                  const CardsPage(),
                  const SettingsPage(),
                ].elementAt(model.selectedIndex),
              ),
            ));
  }
}
