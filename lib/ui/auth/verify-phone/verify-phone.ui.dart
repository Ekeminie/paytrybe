// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paytrybe/constant/palette.dart';
import 'package:paytrybe/routes/routes.dart';
import 'package:paytrybe/ui/auth/verify-phone/verify-phone.vm.dart';
import 'package:paytrybe/ui/base.ui.dart';
import 'package:paytrybe/ui/widgets/custom-back-button.dart';
import 'package:paytrybe/ui/widgets/custom_btn.dart';
import 'package:paytrybe/ui/widgets/resend-otp-widget.dart';
import 'package:paytrybe/utils/widget_extensions.dart';
import 'package:pinput/pinput.dart';

class VerifyPhonePage extends StatefulWidget {
  const VerifyPhonePage({Key? key}) : super(key: key);

  @override
  _VerifyPhonePageState createState() => _VerifyPhonePageState();
}

class _VerifyPhonePageState extends State<VerifyPhonePage> {
  ValueNotifier<bool> isShowingTimer = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return BaseView<VerifyPhoneViewModel>(
        builder: (context, model, child) => Scaffold(
            backgroundColor: white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: white,
              centerTitle: true,
              title: const Text(
                "Create Account",
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              leading: const CustomBackButton(),
            ),
            body: LayoutBuilder(builder: (context, constraints) {
              return SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minWidth: constraints.maxWidth,
                        minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          24.sbH,
                          Text(
                            "Verify Phone Number",
                            style: TextStyle(
                                color: primaryDarkColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 24.sp),
                          ),
                          40.0.sbH,
                          Column(
                            children: [
                              const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      "Enter 6 digit OTP code sent to +1 709 200 1200 ")),
                              16.sbH,
                              Pinput(
                                defaultPinTheme: defaultPinTheme,
                                focusedPinTheme: focusedPinTheme,
                                submittedPinTheme: submittedPinTheme,
                                pinputAutovalidateMode:
                                    PinputAutovalidateMode.onSubmit,
                                showCursor: true,
                                length: 6,
                              ),
                              32.sbH,
                              ResendOtpWidget(
                                  isShowingTimer: isShowingTimer,
                                  resendOtpCallback: () {})
                            ],
                          ),
                          52.sbH,
                          Expanded(
                            flex: 4,
                            child: Container(),
                          ),
                          Hero(
                            tag: "welcomeToLogin",
                            child: UiButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, Routes.signupRoute),
                              text: "Continue",
                              loadingState: model.viewState,
                            ),
                          ),
                          Expanded(child: Container())
                        ],
                      ),
                    ),
                  ),
                ),
              );
            })));
  }
}
