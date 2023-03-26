// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:paytrybe/utils/string-extensions.dart';
import 'package:paytrybe/utils/widget_extensions.dart';

class CountryPicker extends StatelessWidget {
  final String icon;
  const CountryPicker({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(icon.png),
          4.sbW,
          const Icon(Icons.keyboard_arrow_down_outlined)
        ],
      ),
    );
  }
}
