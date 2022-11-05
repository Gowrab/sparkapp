import 'package:flutter/material.dart';
import 'package:sparkapp/constants/app_colors.dart';
import 'package:sparkapp/services/auth_service.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class LoginViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final AuthService _authService = locator<AuthService>();
  final DialogService _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  bool errorStatus = false;
  String? errorMessage;

  Future onSubmit(String emailAddress, String password) async {
    if (formKey.currentState?.validate() != true) return;

    setBusy(true);

    var result = await _authService.loginWithEmail(
        email: emailAddress, password: password);

    setBusy(false);

    if (result is bool) {
      if (result) {
        //_navigationService.navigateTo(HomeViewRoute);
      } else {
        await _dialogService.showDialog(
            title: 'Login Failure',
            description: 'General login failure. Please try again later',
            buttonTitleColor: backgroundColor);
      }
    } else {
      await _dialogService.showDialog(
          title: 'Login Failure',
          description: result,
          buttonTitleColor: backgroundColor);
    }
  }

  navigateToRegistration() {
    _navigationService.back();
  }

  navigateToForgot() {
    _navigationService.navigateTo(Routes.forgetPasswordView);
  }
}
