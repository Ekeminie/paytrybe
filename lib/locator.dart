import 'package:get_it/get_it.dart';
import 'package:paytrybe/ui/auth/get-started/get-started.vm.dart';
import 'package:paytrybe/ui/auth/signup/signup.vm.dart';
import 'package:paytrybe/ui/auth/verify-phone/verify-phone.vm.dart';
import 'package:paytrybe/ui/auth/welcome/welcome.vm.dart';
import 'package:paytrybe/ui/cards/cards.vm.dart';
import 'package:paytrybe/ui/home/home.vm.dart';
import 'package:paytrybe/ui/settings/settings.vm.dart';
import 'package:paytrybe/ui/transactions/transactions.vm.dart';
import 'package:paytrybe/utils/initializer.dart';

import 'core/services/navigation_service.dart';

GetIt getIt = GetIt.I;

dependenciesInjectorSetup() {
  //View Model

  //Auth ViewModels
  getIt.registerFactory<WelcomeViewModel>(() => WelcomeViewModel());
  getIt.registerFactory<GetStartedViewModel>(() => GetStartedViewModel());
  getIt.registerFactory<SignUpViewModel>(() => SignUpViewModel());
  getIt.registerFactory<HomeViewModel>(() => HomeViewModel());
  getIt.registerFactory<CardsViewModel>(() => CardsViewModel());
  getIt.registerFactory<TransactionsViewModel>(() => TransactionsViewModel());
  getIt.registerFactory<SettingsViewModel>(() => SettingsViewModel());
  getIt.registerFactory<VerifyPhoneViewModel>(() => VerifyPhoneViewModel());

  // Services
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  getIt.registerLazySingleton(() => Initializer());

//  ChangePasswordViewModel
}
