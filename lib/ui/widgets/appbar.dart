import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paytrybe/constant/palette.dart';
import 'package:paytrybe/core/services/navigation_service.dart';
import 'package:paytrybe/locator.dart';

AppBar customAppBar(String title,
    {bool isLeftAligned = false,
    List<Widget>? actions,
    bool showBackButton = true,
    bool overrideBackButtonAction = false,
    bool showXIcon = false,
    Function? backFunction,
    Color? bgColor}) {
  final navigate = getIt<NavigationService>();
  return AppBar(
    backgroundColor: bgColor ?? white,
    leading: isLeftAligned
        ? null
        : showBackButton
            ? overrideBackButtonAction
                ? showXIcon
                    ? IconButton(
                        onPressed: () => backFunction!(), //navigate.goBack(),
                        icon: Icon(
                          Icons.close,
                          color: textDark,
                        ))
                    : BackButton(
                        color: textDark,
                        onPressed: () => backFunction!(),
                      )
                : showXIcon
                    ? IconButton(
                        onPressed: () => navigate.goBack(),
                        icon: Icon(
                          Icons.close,
                          color: textDark,
                        ))
                    : BackButton(color: textDark)
            : null,
    elevation: 0,
    centerTitle: !isLeftAligned,
    leadingWidth: isLeftAligned ? 10.w : null,
    title: Text(
      title,
      style: TextStyle(
        color: textDark,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      ),
    ),
    actions: actions ?? const [SizedBox.shrink()],
  );
}
