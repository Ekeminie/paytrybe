import 'package:flutter/material.dart';
import 'package:paytrybe/constant/palette.dart';

class BGBorderWidget extends StatelessWidget {
  final Widget child;
  const BGBorderWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: border,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
