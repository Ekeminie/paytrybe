import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:oktoast/oktoast.dart';
import 'package:paytrybe/locator.dart';
import 'package:paytrybe/routes/router.dart';
import 'package:paytrybe/routes/routes.dart';

import 'constant/palette.dart';
import 'core/services/navigation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  //setup dependency injector
  dependenciesInjectorSetup();
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  final bool? loggedIn;

  const MyApp({Key? key, this.loggedIn}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (child, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: getIt<NavigationService>().navigatorKey,
            scaffoldMessengerKey: getIt<NavigationService>().snackBarKey,
            theme: ThemeData(
              scaffoldBackgroundColor: white,
              textTheme: Theme.of(context).textTheme.apply(
                    bodyColor: primaryDarkColor,
                    displayColor: primaryDarkColor,
                    fontFamily: 'TT Commons',
                  ),
              colorScheme:
                  ThemeData().colorScheme.copyWith(primary: primaryColor),
              primaryColor: primaryColor,
              backgroundColor: white,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            onGenerateRoute: Routers.generateRoute,
            initialRoute: Routes.welcomeRoute,
            navigatorObservers: [FlutterSmartDialog.observer],
            builder: FlutterSmartDialog.init(builder: (context, widget) {
              return MediaQuery(
                ///Setting font does not change with system font size
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              );
            }),
          );
        },
      ),
    );
  }
}
