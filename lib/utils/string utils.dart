import 'dart:developer' as devtools show log;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

copyToClipBoard(String data) {
  Clipboard.setData(ClipboardData(text: data));
  showToast("Copied to Clipboard");
}

void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => debugPrint(match.group(0)));
}

String camelToSentence(String text) {
  return text.replaceAllMapped(RegExp(r'^([a-z])|[A-Z]'),
      (Match m) => m[1] == null ? " ${m[0]}" : m[1]!.toUpperCase());
}
