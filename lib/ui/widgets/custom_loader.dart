import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paytrybe/ui/widgets/scale-animation.dart';
import 'package:paytrybe/utils/string-extensions.dart';

Widget loader = ScaleAnimationWidget(
  child: SvgPicture.asset(
    "figur-logo".svg,
    height: 50.h,
  ),
);

// Widget successAnimation = Lottie.asset('assets/success.json', repeat: false);
