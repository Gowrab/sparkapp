import 'package:flutter/material.dart';
import 'package:sparkapp/ui/views/forget_password_page/forget_password_form.dart';
import 'package:sparkapp/ui/views/forget_password_page/forget_password_view_model.dart';
import 'package:sparkapp/ui/widgets/head_text_widget.dart';
import 'package:stacked/stacked.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_text.dart';


class ForgetPasswordView extends StatelessWidget {

  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgetPasswordViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeadTextWidget(headLine: "Forgot Password"),
                        Text(forgetPassText,style: regularTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),),
                        const SizedBox(height: 5,),
                        ForgetPasswordForm(),

                        const SizedBox(height: 20,),

                        ElevatedButton(
                          onPressed: () {
                            model.navigateBack();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: secondaryButtonColor,
                              foregroundColor: secondaryButtonColor
                          ),
                          child: Text(
                            "Cancel",
                            style: mediumTextStyle.copyWith(color: backgroundColor),
                          ),
                        ),
                      ],
                    ),
                  ))),
        );
      },
      viewModelBuilder: () => ForgetPasswordViewModel(),
    );
  }
}
