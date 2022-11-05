import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sparkapp/app/app.locator.dart';
import 'package:sparkapp/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../constants/app_colors.dart';
import '../../../services/auth_service.dart';

class RegistrationViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final DialogService _dialogService = locator<DialogService>();

  bool selectVal = true;
  String dob = "";
  String gender = "";
  final genderList = ["Male", "Female"];

  init() {}

  void onSubmit(
      {required String email,
      required String password,
      required String name,
      String? dob,
      String? gender}) async {
    if (formKey.currentState?.validate() != true) return;

    setBusy(true);
    var result = await _authService.signUpWithEmail(
        email: email,
        password: password,
        name: name,
        dob: dob ?? "",
        gender: gender ?? "");

    setBusy(false);
    if (result != null) {
      await _dialogService.showDialog(
          title: 'Registration Failure',
          description: result.toString(),
          buttonTitleColor: backgroundColor);

    } else {
      _navigationService.navigateTo(Routes.homeView);
    }
  }

  final items = List<String>.generate(
      100, (index) => DateTime(DateTime.now().year - index).year.toString());

  void acceptCondition(bool val) {
    selectVal = val;
  }

  navigateToLogin() {
    _navigationService.navigateTo(Routes.loginView);
  }
}
