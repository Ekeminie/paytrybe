import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paytrybe/constant/palette.dart';
import 'package:timer_count_down/timer_count_down.dart';

class ResendOtpWidget extends StatelessWidget {
  final int seconds;
  final Widget? customWidget;
  final Function resendOtpCallback;

  const ResendOtpWidget(
      {Key? key,
      required this.isShowingTimer,
      this.seconds = 20,
      this.customWidget,
      required this.resendOtpCallback})
      : super(key: key);

  final ValueNotifier<bool> isShowingTimer;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isShowingTimer,
        builder: (context, bool showTimer, Widget? child) => showTimer
            ? Center(
                child: Countdown(
                seconds: seconds,
                build: (BuildContext context, double time) => Text(
                  "Expires in 00:${time.toString().split(".")[0]}",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                interval: const Duration(milliseconds: 100),
                onFinished: () {
                  isShowingTimer.value = !isShowingTimer.value;
                },
              ))
            : Container(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        /*TODO: Add resend otp callback from view model
                          model.resendOtp();
                        */
                        resendOtpCallback();
                        isShowingTimer.value = !isShowingTimer.value;
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: Colors.black)),
                        child: customWidget ??
                            Text(
                              'Resend code',
                              style: TextStyle(
                                  color: primaryDarkColor,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp),
                            ),
                      ),
                    ),
                  ],
                ),
              ));
  }
}
