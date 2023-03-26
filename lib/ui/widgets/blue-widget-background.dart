import 'package:flutter/material.dart';

class LightBlueBgWidget extends StatelessWidget {
  final Widget child;

  const LightBlueBgWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
            color: Color(0xffF0F5FF), borderRadius: BorderRadius.circular(12)),
        child: child);
  }
}
