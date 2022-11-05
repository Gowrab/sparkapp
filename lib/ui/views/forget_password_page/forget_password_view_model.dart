import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../constants/app_colors.dart';
import '../../../services/auth_service.dart';


class ForgetPasswordViewModel extends BaseViewModel{

  final formKey = GlobalKey<FormState>();
  final AuthService _authService = locator<AuthService>();
  final DialogService _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  Future onSubmit(String emailAddress) async {
    if (formKey.currentState?.validate() != true) return;

    setBusy(true);

    var result = await _authService.forgetPassword(
        email: emailAddress);

    setBusy(false);


    await _dialogService.showDialog(
        title: 'Forgot Password',
        description: result,
        buttonTitleColor: backgroundColor
    );
  }

  navigateBack(){
    _navigationService.back();
  }
}