// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paytrybe/constant/constants.dart';
import 'package:paytrybe/constant/palette.dart';
import 'package:paytrybe/routes/routes.dart';
import 'package:paytrybe/ui/auth/signup/signup.vm.dart';
import 'package:paytrybe/ui/base.ui.dart';
import 'package:paytrybe/ui/widgets/custom-back-button.dart';
import 'package:paytrybe/ui/widgets/custom_btn.dart';
import 'package:paytrybe/ui/widgets/input.dart';
import 'package:paytrybe/utils/string-extensions.dart';
import 'package:paytrybe/utils/widget_extensions.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  ValueNotifier<bool> isShowingTimer = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpViewModel>(
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
                          Text(
                            "Email & Password",
                            style: TextStyle(
                                color: primaryDarkColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 24.sp),
                          ),
                          4.sbH,
                          Text(
                            "Enter First & last name as seen in you ID ",
                            style: TextStyle(
                                color: primaryDarkColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp),
                          ),
                          10.0.sbH,
                          40.0.sbH,
                          Input(
                            textInputAction: TextInputAction.next,
                            controller: model.fNameController,
                            labelText: 'First name & Last Name',
                            onChanged: (v) => model.fName = v,
                          ),
                          16.0.sbH,
                          Input(
                            textInputAction: TextInputAction.next,
                            controller: model.emailController,
                            labelText: 'Email Address',
                            onChanged: (v) => model.email = v,
                          ),
                          16.0.sbH,
                          Input(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: model.obscurePassword,
                            controller: model.passwordController,
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: () => model.togglePasswordVisibility(),
                              icon: model.obscurePassword
                                  ? const Icon(Icons.visibility_off_outlined)
                                  : const Icon(Icons.visibility_outlined),
                            ),
                            onChanged: (v) => model.password = v,
                          ),
                          32.0.sbH,
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 10.0,
                                color: Color(0xff011B33),
                              ),
                              children: [
                                const TextSpan(
                                  text:
                                      'By continuing, you agree to Paytribe, ',
                                ),
                                TextSpan(
                                    text: 'Platform terms and Conditions',
                                    style: const TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.w500),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        openUrl(url: termsOfService);
                                      }),
                                const TextSpan(
                                  text: ', ',
                                ),
                                TextSpan(
                                    text: 'Rewards Policy',
                                    style: const TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.w500),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        openUrl(url: rewardsPolicy);
                                      }),
                                TextSpan(
                                    text: ', ',
                                    style: TextStyle(color: textLight)),
                                TextSpan(
                                    text: 'Privacy Policy',
                                    style: const TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.w500),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        openUrl(url: privacyPolicy);
                                      }),
                                const TextSpan(
                                  text: '.',
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(),
                          ),
                          Hero(
                            tag: "welcomeToLogin",
                            child: UiButton(
                              onPressed: () => model.navigationService
                                  .navigateToReplace(Routes.homeRoute),
                              text: "Continue",
                              loadingState: model.viewState,
                            ),
                          ),
                          16.0.sbH,
                          Expanded(child: Container()),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            })));
  }
}
