import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class HomeViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final _navigationService = locator<NavigationService>();

  final _user = FirebaseAuth.instance.currentUser!;

  User get user => _user;

  void onSubmit() async {
    setBusy(true);
    await FirebaseAuth.instance.signOut();
    setBusy(false);
    _navigationService.back();
  }

  navigateToRegistration() {
    _navigationService.navigateTo(Routes.registrationView);
  }

  navigateToLogin() {
    _navigationService.navigateTo(Routes.loginView);
  }
}
