import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/app_colors.dart';

class CustomTextFieldOutline extends StatelessWidget {
  final TextEditingController? controller;
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

  const CustomTextFieldOutline({
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: borderColor,
      ),
      borderRadius: BorderRadius.circular(60),
    );

    return Column(
      children: [
        TextFormField(
          controller: controller,
          onTap: onTap,
          readOnly: readOnly,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          maxLines: maxLines,
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            fillColor: color,
            filled: true,
            enabledBorder: outlineInputBorder,
            contentPadding: const EdgeInsets.only(left: 22, top: 1, bottom: 1),
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
              fontWeight: FontWeight.bold,
              color: fontColor

            ),
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
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
