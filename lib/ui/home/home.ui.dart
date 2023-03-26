import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paytrybe/constant/palette.dart';
import 'package:paytrybe/utils/string-extensions.dart';
import 'package:paytrybe/utils/widget_extensions.dart';

import '../base.ui.dart';
import 'home.vm.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: bgColor,
        body: RefreshIndicator(
          onRefresh: () async {
            //make api calls
          },
          child: SingleChildScrollView(
            child: Stack(
              // mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: height(context) / 2.5,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(color: primaryColor),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xff5583FD),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'paytribe'.svg,
                                  height: 20,
                                  width: 20,
                                ),
                                4.sbW,
                                Text(
                                  "\$Paytrybe",
                                  style: TextStyle(
                                      color: white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                          SvgPicture.asset(
                            'notification'.svg,
                            height: 40,
                            width: 40,
                          )
                        ],
                      ),
                      16.sbH,
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 14.0,
                            color: white,
                          ),
                          children: [
                            TextSpan(
                                text: '\$',
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            const TextSpan(
                              text: '100',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            TextSpan(
                                text: '.00',
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                      16.sbH,
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: white),
                            color: const Color(0xff5583FD),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 10,
                                backgroundImage: AssetImage(
                                  'canada'.png,
                                ),
                              ),
                              12.sbW,
                              Text(
                                "CAD Dollar",
                                style: TextStyle(
                                    color: white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              12.sbW,
                              Icon(
                                Icons.play_circle_filled_sharp,
                                color: white,
                              )
                            ],
                          ),
                        ),
                      ),
                      32.sbH,
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => {},
                              child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: white)),
                                  child: Center(
                                    child: Text(
                                      "Add Money",
                                      style: TextStyle(color: white),
                                    ),
                                  )),
                            ),
                          ),
                          24.sbW,
                          Expanded(
                            child: GestureDetector(
                              onTap: () => {},
                              child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Send Money",
                                      style: TextStyle(color: primaryColor),
                                    ),
                                  )),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      300.sbH,
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(24),
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <int>[0, 1, 2]
                                  .map((e) => Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SvgPicture.asset(
                                                dashBoardIcons[e].svg),
                                            8.sbH,
                                            Text(
                                              dashBoardActions[e],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            )
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                          42.sbH,
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(24),
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Getting Started",
                                  style: TextStyle(color: textLight),
                                ),
                                32.sbH,
                                CustomGettingStartedTiles(
                                  icon: 'verify-email',
                                  title: 'Verify Email',
                                  isDone: true,
                                  subTitle:
                                      "To protect your account we need to verify your e-mail address",
                                ),
                                CustomGettingStartedTiles(
                                  icon: 'verify-identity',
                                  title: 'Verify Identity',
                                  isDone: true,
                                  subTitle:
                                      "To protect your account we need to verify your e-mail address",
                                ),
                                CustomGettingStartedTiles(
                                  icon: 'fund-account',
                                  title: 'Fund Account',
                                  isDone: false,
                                  subTitle:
                                      "To protect your account we need to verify your e-mail address",
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomGettingStartedTiles extends StatelessWidget {
  bool? isDone;
  String icon;
  String title;
  String subTitle;
  CustomGettingStartedTiles(
      {Key? key,
      this.isDone,
      required this.icon,
      required this.title,
      required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            SvgPicture.asset(icon.svg),
            16.sbW,
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  8.sbH,
                  Text(
                    subTitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                ],
              ),
            ),
            16.sbW,
            isDone!
                ? SvgPicture.asset('verified'.svg)
                : SvgPicture.asset('unverified'.svg)
          ],
        ),
        10.sbH,
        if (isDone!) const Divider()
      ],
    );
  }
}

var dashBoardActions = ['Request\nMoney', "Exchange\nCurrency", "Buy\nAirtime"];
var dashBoardIcons = ['request-money', 'exchange-currency', 'buy-airtime'];
