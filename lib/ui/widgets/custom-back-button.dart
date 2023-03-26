// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paytrybe/utils/string-extensions.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: SizedBox(
        height: 20,
        child: SvgPicture.asset(
          'back-icon'.svg,
          height: 20,
          width: 20,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
