import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sparkapp/constants/app_colors.dart';
import 'package:sparkapp/ui/views/home_page/home_view.dart';
import 'package:sparkapp/ui/views/login_page/login_form.dart';
import 'package:sparkapp/ui/views/login_page/login_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../../constants/app_strings.dart';
import '../../../constants/app_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const HomeView();
              } else {
                return SafeArea(
                    child: SingleChildScrollView(
                        child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LoginForm(),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: GestureDetector(
                              onTap: () {
                                model.navigateToForgot();
                              },
                              child: const Text(
                                "Forgot your password",
                                style: regularTextStyle,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            top: 50,
                          ),
                          child: Text(
                            "Don't have an account? Register now!",
                            style: boldTextStyle.copyWith(color: mainColor),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            model.navigateToRegistration();
                          },
                          child: Text(
                            "Register",
                            style: mediumTextStyle.copyWith(
                                color: backgroundColor),
                          ),
                        )
                      ],
                    ),
                  ),
                )));
              }
            },
          ),
        );
      },
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
