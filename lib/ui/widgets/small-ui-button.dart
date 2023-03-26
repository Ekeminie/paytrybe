import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallUIButton extends StatelessWidget {
  Color? borderColor;
  Color? bgColor;
  String? title;
  Color? textColor;
  Function? onTap;
  EdgeInsetsGeometry? padding;
  BorderRadiusGeometry? borderRadius;
  SmallUIButton(
      {Key? key,
      this.title,
      this.bgColor,
      this.borderColor,
      this.textColor,
      this.padding,
      this.borderRadius,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              side: borderColor != null
                  ? BorderSide(color: borderColor!)
                  : BorderSide(color: bgColor!),
              borderRadius: borderRadius ?? BorderRadius.circular(18.0)),
          backgroundColor: bgColor,
          padding:
              padding ?? EdgeInsets.symmetric(horizontal: 11.w, vertical: 10.h),
        ),
        onPressed: () => onTap!() ?? {},
        child: Text(
          title ?? "",
          style: TextStyle(color: textColor),
        ));
  }
}
