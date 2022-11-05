import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sparkapp/constants/app_text.dart';
import 'package:sparkapp/ui/views/registration_page/registration_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/head_text_widget.dart';
import '../home_page/home_view.dart';
import 'registration_form.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegistrationViewModel>.reactive(
      onModelReady: (RegistrationViewModel model) async {
        await model.init();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const HomeView();
              } else {
                return SafeArea(
                    child: SingleChildScrollView(
                        child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      HeadTextWidget(headLine: "Let's begin"),
                      RegistrationForm(),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GestureDetector(
                            onTap: () {
                              viewModel.navigateToLogin();
                            },
                            child: const Text(
                              "Already have a profile? Login",
                              style: regularTextStyle,
                            )),
                      )
                    ],
                  ),
                )));
              }
            },
          ),
        );
      },
      viewModelBuilder: () => RegistrationViewModel(),
    );
  }
}
