import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sparkapp/ui/views/registration_page/registration_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../constants/app_colors.dart';

class FormFieldDropdown extends StatelessWidget {
  final SingleValueDropDownController? controller;
  final Function()? onTap;
  final bool readOnly;
  final bool obscureText;
  final int maxLines;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? hintText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color color;
  final Color outlineColor;
  final Function(String)? onChanged;
  final Function()? onSuffixIconTap;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final List<String>? dropDownList;

  const FormFieldDropdown({
    Key? key,
    this.controller,
    this.onTap,
    this.readOnly = false,
    this.obscureText = false,
    this.maxLines = 1,
    this.keyboardType,
    this.textInputAction,
    this.hintText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.color = backgroundColor,
    this.outlineColor = mainColor,
    this.onChanged,
    this.onSuffixIconTap,
    this.inputFormatters,
    this.validator,
    required this.dropDownList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: borderColor,
      ),
      borderRadius: BorderRadius.circular(60),
    );

    return ViewModelBuilder<RegistrationViewModel>.reactive(
      builder: (context, viewModel, child) {
        return Column(
          children: [
            DropDownTextField(
              // initialValue: "name4",
              controller: controller,

              clearOption: false,
              textFieldDecoration: InputDecoration(
                fillColor: color,
                filled: true,
                enabledBorder: outlineInputBorder,
                floatingLabelAlignment: FloatingLabelAlignment.start,
                contentPadding: const EdgeInsets.only(
                    left: 22, top: 1, bottom: 1, right: 22),
                focusedBorder: outlineInputBorder.copyWith(
                  borderSide: const BorderSide(
                    color: mainColor,
                    width: 1.5,
                  ),
                ),
                errorBorder: outlineInputBorder.copyWith(
                  borderSide: const BorderSide(
                    color: dangerColor,
                  ),
                ),
                focusedErrorBorder: outlineInputBorder.copyWith(
                  borderSide: const BorderSide(
                    color: dangerColor,
                    width: 1.5,
                  ),
                ),
                hintText: hintText,
                hintStyle: const TextStyle(
                    fontWeight: FontWeight.bold, color: fontColor),
                errorText: errorText,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon == null
                    ? null
                    : SizedBox(
                        height: 50,
                        width: 50,
                        child: GestureDetector(
                          onTap: onSuffixIconTap,
                          child: suffixIcon,
                        ),
                      ),
                errorMaxLines: 2,
              ),
              dropDownList: dropDownList!.map((value) {
                return DropDownValueModel(name: value, value: value);
              }).toList(),
              onChanged: (val) {
                //viewModel.onChangeFun(val, choseValue);
              },
            ),

            const SizedBox(
              height: 15,
            ),
          ],
        );
      },
      viewModelBuilder: () => RegistrationViewModel(),
    );
  }
}
