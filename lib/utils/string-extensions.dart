import 'dart:io';

import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart' show launchUrl;

RegExp _numeric = RegExp(r'^-?[0-9]+$');

/// check if the string contains only numbers
bool isNumeric(String str) {
  return _numeric.hasMatch(str);
}

const ext = 0;
final formatCurrency =
    NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
final nairaCurrency =
    NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');

//Formats the amount and returns a formatted amount
String formatPrice(String amount) {
  return nairaCurrency.format(num.parse(amount)).toString();
}

extension StringCasingExtension on String {
  String? camelCase() => toBeginningOfSentenceCase(this);
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
  String? trimToken() => contains(":") ? split(":")[1].trim() : this;
  String? trimSpaces() => replaceAll(" ", "");
  String? stripInternationalNumbers() => isNotEmpty
      ? contains("+234")
          ? replaceAll("+234", "0")
          : this
      : "";

  String getInitials() => isNotEmpty
      ? trim().split(RegExp(' +')).map((s) => s[0].toUpperCase()).take(2).join()
      : '';
  String getNumbers() =>
      isNotEmpty ? replaceAll(RegExp('[^0-9]'), '').replaceAll("-", "") : "";
  String getAlphabets() =>
      isNotEmpty ? replaceAll(RegExp('[^A-Za-z]'), '').replaceAll("-", "") : "";
  String getAlphaNumeric() => isNotEmpty
      ? replaceAll(RegExp('[^A-Za-z0-9]'), '').replaceAll("-", "")
      : "";
  String? trimLength(int startRange) => replaceRange(startRange, length, ".");
  String get inCaps =>
      length > 0 ? '${this[0].toUpperCase()}${this.substring(1)}' : '';
  String get capitalizeFirstOfEach => replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.inCaps)
      .join(" ");
}

extension ImagePath on String {
  String get svg => 'assets/images/$this.svg';
  String get png => 'assets/images/$this.png';
  String get jpg => 'assets/images/$this.jpg';
}

extension ExtraStringMethods on String? {}

extension NumExtensions on int {
  num addPercentage(num v) => this + ((v / 100) * this);
  num getPercentage(num v) => ((v / 100) * this);
}

extension NumExtensionss on num {
  num addPercentage(num v) => this + ((v / 100) * this);
  num getPercentage(num v) => ((v / 100) * this);
}

void openUrl({String? url}) {
  launchUrl(Uri.parse(url!));
}

void openMailApp({String? receiver, String? title, String? body}) {
  launchUrl(Uri.parse("mailto:$receiver?subject=$title&body=$body"));
}

void makeCall({String? number}) {
  launchUrl(Uri.parse("tel:$number"));
}

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}
