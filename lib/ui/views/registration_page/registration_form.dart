import 'package:collection/collection.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:sparkapp/constants/app_colors.dart';

import 'package:sparkapp/ui/views/registration_page/registration_view_model.dart';
import 'package:sparkapp/ui/widgets/form_field_widget.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../constants/app_text.dart';
import '../../../utils/validators.dart';
import '../../widgets/form_dropdown_field.dart';

class RegistrationForm extends HookViewModelWidget<RegistrationViewModel> {
  @override
  Widget buildViewModelWidget(
      BuildContext context, RegistrationViewModel viewModel) {
    final Validator validator = Validator();
    var usernameController = useTextEditingController();
    var yearOfBirthController = SingleValueDropDownController();
    var genderController = SingleValueDropDownController();
    var emailController = useTextEditingController();
    var passwordController = useTextEditingController();
    var confirmPasswordController = useTextEditingController();

    return Form(
        key: viewModel.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  CustomTextFieldOutline(
                    hintText: "Name*",
                    controller: usernameController,
                    keyboardType: TextInputType.text,
                    validator: (val) {
                      List<String?> errors = [
                        validator.validateEmpty(value: val, field: 'name'),
                      ];

                      return errors.firstWhereOrNull((error) => error != null);
                    },
                  ),

                  FormFieldDropdown(
                    hintText: "Year of birth",
                    dropDownList: viewModel.items,
                    controller: yearOfBirthController,
                  ),
                  FormFieldDropdown(
                    hintText: "Gender",
                    dropDownList: viewModel.genderList,
                    controller: genderController,
                  ),
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
                  CustomTextFieldOutline(
                    hintText: "Confirm Password*",
                    controller: confirmPasswordController,
                    obscureText: true,
                    validator: (val) {
                      List<String?> errors = [
                        validator.validateEmpty(
                            value: val, field: 'confirm password'),
                        validator.validatePasswordMatch(
                            password: passwordController.text,
                            confirmPassword: val!)
                      ];

                      return errors.firstWhereOrNull((error) => error != null);
                    },
                  ),
                ],
              ),
            ),
            RadioListTile(
              value: viewModel.selectVal,
              groupValue: viewModel.selectVal,
              onChanged: (bool? value) {
                viewModel.acceptCondition(value!);
              },
              title: const Text(
                "I have read the Terms of Use and Privacy Policy and I want to proceed.",
                style: regularTextStyle,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => viewModel.isBusy
                  ? null
                  : viewModel.onSubmit(
                      email: emailController.text,
                      password: passwordController.text,
                      name: usernameController.text,
                      dob: yearOfBirthController.dropDownValue?.value,
                      gender: genderController.dropDownValue?.value),
              child: viewModel.isBusy
                  ? const CircularProgressIndicator(
                      color: backgroundColor,
                    )
                  : Text(
                      "Save",
                      style: mediumTextStyle.copyWith(color: backgroundColor),
                    ),
            )
          ],
        ));
  }
}
