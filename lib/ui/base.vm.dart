import 'package:flutter/material.dart';
import 'package:paytrybe/locator.dart';
import 'package:paytrybe/utils/debounce.dart';

import '../core/enum/viewState.enum.dart';
import '../core/services/navigation_service.dart';

class BaseViewModel extends ChangeNotifier {
  final debouncer = Debouncer();
  ViewState _viewState = ViewState.idle;
  NavigationService navigationService = getIt<NavigationService>();

  ViewState get viewState => _viewState;

  set viewState(ViewState newState) {
    if (newState == ViewState.busy) {
      hasError = false;
    }
    _viewState = newState;
    notifyListeners();
  }

  bool isLoading = false;
  bool hasError = false;
  Function? retryFunction;
  String? errorMessage;

  void showError(Function function, {String? msg}) {
    if (!hasError) {
      hasError = true;
      retryFunction = function;
      errorMessage = msg ?? "Request Failed, Try again";
      notifyListeners();
      stopLoader();
    }
  }

  void startLoader() {
    if (!isLoading) {
      hasError = false;
      isLoading = true;
      viewState = ViewState.busy;
      notifyListeners();
    }
  }

  void stopLoader() {
    if (isLoading) {
      isLoading = false;
      viewState = ViewState.idle;
      notifyListeners();
    }
  }

  dropKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
