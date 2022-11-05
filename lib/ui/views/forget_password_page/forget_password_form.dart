import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sparkapp/ui/views/forget_password_page/forget_password_view_model.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text.dart';
import '../../../utils/validators.dart';
import '../../widgets/form_field_widget.dart';

class ForgetPasswordForm extends HookViewModelWidget<ForgetPasswordViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, ForgetPasswordViewModel viewModel) {
    var emailAddressController = useTextEditingController();
    final Validator validator = Validator();
    return Form(
        key: viewModel.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [

                  CustomTextFieldOutline(
                    hintText: "Email*",
                    controller: emailAddressController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      List<String?> errors = [
                        validator.validateEmpty(value: val, field: 'email'),
                        validator.validateEmail(val!)
                      ];

                      return errors.firstWhereOrNull((error) => error != null);
                    },
                  ),
                  ElevatedButton(
                    onPressed: () => viewModel.isBusy
                        ? null
                        :viewModel.onSubmit(emailAddressController.text),
                    child: viewModel.isBusy?const CircularProgressIndicator(
                      color: backgroundColor,
                    ):Text(
                      "Continue",
                      style: mediumTextStyle.copyWith(color: backgroundColor),
                    ),
                  ),


                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

          ],
        ));
  }

}