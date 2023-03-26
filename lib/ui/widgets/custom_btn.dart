import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:paytrybe/constant/palette.dart';
import 'package:paytrybe/utils/keyboard-utils.dart';

import '../../core/enum/viewState.enum.dart';

class UiButton extends StatefulWidget {
  final String text;
  final Function? onPressed;
  final ViewState loadingState;
  final Color? color;
  final bool isFullWidth;

  const UiButton({
    Key? key,
    required this.text,
    this.isFullWidth = true,
    this.onPressed,
    this.color,
    this.loadingState = ViewState.idle,
  }) : super(key: key);

  @override
  _UiButtonState createState() => _UiButtonState();
}

class _UiButtonState extends State<UiButton> {
  @override
  Widget build(BuildContext context) {
    return widget.isFullWidth
        ? SizedBox(
            // height: Platform.isAndroid ? 52.h : 46.h,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: (widget.loadingState == ViewState.idle)
                    ? () {
                        killKeyboard(context);
                        widget.onPressed!();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.color ?? primaryColor,
                  textStyle: TextStyle(
                    color: white,
                    fontFamily: 'BR Firma',
                  ),
                  padding: EdgeInsets.symmetric(vertical: 18.r),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36.r),
                  ),
                  elevation: 0,
                  disabledBackgroundColor: primaryColor.withOpacity(0.4),
                ),
                child: widget.loadingState == ViewState.idle
                    ? Text(
                        widget.text,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      )
                    : const SpinKitPulse(
                        color: Colors.white,
                        size: 16.0,
                      )),
          )
        : ElevatedButton(
            onPressed: (widget.loadingState == ViewState.idle)
                ? () {
                    killKeyboard(context);
                    widget.onPressed!();
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.color ?? primaryColor,
              textStyle: TextStyle(
                color: white,
                fontFamily: 'BR Firma',
              ),
              padding: EdgeInsets.symmetric(vertical: 17.0.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0.r),
              ),
              elevation: 0,
              disabledBackgroundColor: primaryColor.withOpacity(0.4),
            ),
            child: widget.loadingState == ViewState.idle
                ? Text(
                    widget.text,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'BR Firma',
                    ),
                  )
                : const SpinKitPulse(
                    color: Colors.white,
                    size: 16.0,
                  ));
  }
}

class UiButtonOutlined extends StatefulWidget {
  final String text;
  final Function onPressed;
  final ViewState loadingState;

  const UiButtonOutlined({
    Key? key,
    required this.text,
    required this.onPressed,
    this.loadingState = ViewState.idle,
  }) : super(key: key);

  @override
  _UiButtonOutlinedState createState() => _UiButtonOutlinedState();
}

class _UiButtonOutlinedState extends State<UiButtonOutlined> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: white,
            border: Border.all(color: Color(0xFFD9EAFF)),
            borderRadius: const BorderRadius.all(Radius.circular(24))),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            splashFactory: NoSplash.splashFactory,
            shadowColor: Colors.white,
            textStyle: TextStyle(
              color: textDark,
              fontFamily: 'BR Firma',
            ),
            // padding: const EdgeInsets.symmetric(vertical: 14.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            elevation: 0,
          ),
          onPressed: (widget.loadingState == ViewState.idle)
              ? () {
                  killKeyboard(context);
                  widget.onPressed();
                }
              : null,
          child: widget.loadingState == ViewState.idle
              ? Text(
                  widget.text,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: primaryDarkColor),
                )
              : SpinKitPulse(
                  color: primaryColor,
                  size: 16.0,
                ),
        ));
  }
}
