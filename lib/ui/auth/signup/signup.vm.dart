import 'package:flutter/cupertino.dart';
import 'package:paytrybe/ui/widgets/toast.dart';

import '../../base.vm.dart';

class SignUpViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  //fields for input validation

  bool get hasEmail => _email != null && _email!.isNotEmpty;

  bool get hasPhone =>
      _phoneNumber != null &&
      _phoneNumber!.isNotEmpty &&
      _phoneNumber!.length >= 9;

  bool get hasPassword =>
      _password != null && _password!.isNotEmpty && _password!.length >= 6;

  bool get hasFName =>
      _fName != null && _fName!.isNotEmpty && _fName!.length >= 3;

  bool get hasLName =>
      _lName != null && _lName!.isNotEmpty && _lName!.length >= 3;

  bool get hasOtp => _otp != null && _otp!.isNotEmpty && _otp!.length >= 6;

  bool get isValidSignUpInputs =>
      hasFName && hasLName && hasPhone && hasPassword;

  String? _email;
  String? _otp;
  String? _fName;
  String? _lName;
  String? _password;
  String? _phoneNumber;
  String? _countryCode;

  showValidationMessage() {
    if (!hasFName) {
      showCustomToast("Please enter your First Name");
    } else if (!hasLName) {
      showCustomToast("Please enter your Last Name");
    } else if (!hasPhone) {
      showCustomToast("Please enter a valid Phone Number");
    } else if (!hasPassword) {
      showCustomToast("Please enter your password");
    }
  }

  String? get email => _email;

  String? get password => _password;

  set password(String? value) {
    _password = value;
    notifyListeners();
  }

  set email(String? value) {
    _email = value;
    notifyListeners();
  }

  String? get otp => _otp;

  set otp(String? value) {
    _otp = value;
    notifyListeners();
  }

  String? get fName => _fName;

  set fName(String? value) {
    _fName = value;
    notifyListeners();
  }

  String? get lName => _lName;

  set lName(String? value) {
    _lName = value;
    notifyListeners();
  }

  String? get phoneNumber => _phoneNumber;

  set phoneNumber(String? value) {
    _phoneNumber = value;
    notifyListeners();
  }

  String? get countryCode => _countryCode;

  set countryCode(String? value) {
    _countryCode = value;
    notifyListeners();
  }

  signUpUser() {}
}
