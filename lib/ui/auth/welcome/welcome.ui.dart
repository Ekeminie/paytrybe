import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paytrybe/constant/palette.dart';
import 'package:paytrybe/routes/routes.dart';
import 'package:paytrybe/ui/auth/welcome/welcome.vm.dart';
import 'package:paytrybe/ui/base.ui.dart';
import 'package:paytrybe/utils/string-extensions.dart';
import 'package:paytrybe/utils/widget_extensions.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushNamed(context, Routes.getStartedRoute),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<WelcomeViewModel>(
        builder: (context, model, child) => Scaffold(
            backgroundColor: white,
            body: Container(
              height: height(context),
              width: width(context),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Center(
                child: SvgPicture.asset('logo'.svg),
              ),
            )));
  }
}
