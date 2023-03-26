import 'package:flutter/material.dart';
import 'package:paytrybe/constant/palette.dart';

class LightBgWidget extends StatelessWidget {
  final Widget child;

  const LightBgWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }
}
