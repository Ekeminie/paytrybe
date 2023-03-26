import 'package:flutter/cupertino.dart';
import 'package:paytrybe/core/enum/viewState.enum.dart';
import 'package:paytrybe/locator.dart';
import 'package:paytrybe/ui/base.vm.dart';

class WelcomeViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  submit() async {
    if (emailController.text.isNotEmpty && passwordController.text.length > 5) {
      //kill the  keyboard
      FocusManager.instance.primaryFocus?.unfocus();

      viewState = ViewState.busy;
    } else {
      //update viewState
      viewState = ViewState.idle;
    }
  }
}
