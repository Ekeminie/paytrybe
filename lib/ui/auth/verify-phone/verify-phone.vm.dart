import 'package:flutter/cupertino.dart';
import 'package:paytrybe/constant/country-providers.dart';
import 'package:paytrybe/ui/base.vm.dart';

class VerifyPhoneViewModel extends BaseViewModel {
  TextEditingController phoneController = TextEditingController();
  CountryProvider countryProvider =
      CountryProvider(name: "canada", prefix: "+1");

  setCountry(CountryProvider country) {
    countryProvider = country;
    notifyListeners();
  }
}
