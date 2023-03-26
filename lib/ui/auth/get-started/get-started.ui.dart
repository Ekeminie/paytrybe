// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paytrybe/constant/constants.dart';
import 'package:paytrybe/constant/palette.dart';
import 'package:paytrybe/routes/routes.dart';
import 'package:paytrybe/ui/auth/get-started/get-started.vm.dart';
import 'package:paytrybe/ui/base.ui.dart';
import 'package:paytrybe/ui/widgets/countries-bottomsheet.dart';
import 'package:paytrybe/ui/widgets/country-picker.dart';
import 'package:paytrybe/ui/widgets/custom_btn.dart';
import 'package:paytrybe/utils/string-extensions.dart';
import 'package:paytrybe/utils/widget_extensions.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  ValueNotifier<bool> isShowingTimer = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return BaseView<GetStartedViewModel>(
        builder: (context, model, child) => Scaffold(
            backgroundColor: white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: white,
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
                            "Get Started",
                            style: TextStyle(
                                color: primaryDarkColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 24.sp),
                          ),
                          40.0.sbH,
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.black)),
                            child: Column(
                              children: [
                                TextField(
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16),
                                  autofocus: true,
                                  controller: model.phoneController,
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(24),
                                      border: InputBorder.none,
                                      prefixText: model.countryProvider.prefix!,
                                      prefixStyle: const TextStyle(
                                          color: Colors.black, fontSize: 16),
                                      prefixIcon: GestureDetector(
                                        onTap: () => showCountriesBottomSheet(
                                            context,
                                            onCountrySelected: (country) =>
                                                model.setCountry(country),
                                            value: model.countryProvider),
                                        child: CountryPicker(
                                            icon: model.countryProvider.name!),
                                      )),
                                )
                              ],
                            ),
                          ),
                          52.sbH,
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
                            flex: 4,
                            child: Container(),
                          ),
                          Hero(
                            tag: "welcomeToLogin",
                            child: UiButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, Routes.verifyPhoneRoute),
                              text: "Continue",
                              loadingState: model.viewState,
                            ),
                          ),
                          36.0.sbH,
                          Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'Have an account ?',
                                  ),
                                  const TextSpan(
                                    text: ' ',
                                  ),
                                  TextSpan(
                                      text: 'Sign in',
                                      style: TextStyle(
                                          color: primaryColor,
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w500),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => model.navigationService
                                            .navigateTo(Routes.loginRoute)),
                                ],
                              ),
                            ),
                          ),
                          32.sbH
                        ],
                      ),
                    ),
                  ),
                ),
              );
            })));
  }
}
