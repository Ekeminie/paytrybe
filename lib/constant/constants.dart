import 'package:flutter_dotenv/flutter_dotenv.dart';

const String token = 'token';
const String currentUser = 'currentUser';
const String settings = 'settings';
const String imagePath = "assets/images/";
const String naira = '₦';
String get termsOfService => dotenv.env['TERMS_OF_SERVICE']!;
String get rewardsPolicy => dotenv.env['REWARDS_POLICY']!;
String get privacyPolicy => dotenv.env['PRIVACY_POLICY']!;
