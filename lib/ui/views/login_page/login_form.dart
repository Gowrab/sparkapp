import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text.dart';
import '../../../utils/validators.dart';
import '../../widgets/form_field_widget.dart';
import '../../widgets/head_text_widget.dart';
import 'login_view_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginForm extends HookViewModelWidget<LoginViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, LoginViewModel viewModel) {
    final Validator validator = Validator();
    var emailController = useTextEditingController();
    var passwordController = useTextEditingController();
    return Form(
        key: viewModel.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            HeadTextWidget(headLine: "Log in"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  CustomTextFieldOutline(
                    hintText: "Email*",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      List<String?> errors = [
                        validator.validateEmpty(value: val, field: 'email'),
                        validator.validateEmail(val!)
                      ];

                      return errors.firstWhereOrNull((error) => error != null);
                    },
                  ),
                  CustomTextFieldOutline(
                    hintText: "Password*",
                    controller: passwordController,
                    obscureText: true,
                    validator: (val) {
                      List<String?> errors = [
                        validator.validateEmpty(value: val, field: 'password'),
                      ];

                      return errors.firstWhereOrNull((error) => error != null);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                viewModel.isBusy
                    ? null
                    : viewModel.onSubmit(
                        emailController.text, passwordController.text);
              },
              child: viewModel.isBusy
                  ? const CircularProgressIndicator(
                      color: backgroundColor,
                    )
                  : Text(
                      "Let's go",
                      style: mediumTextStyle.copyWith(color: backgroundColor),
                    ),
            )
          ],
        ));
  }
}
