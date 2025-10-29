import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_styles.dart';

typedef onValidator = String? Function(String?)?;

class CustomTextFormField extends StatelessWidget {
  Color borderSideColor;
  String? hintText;
  String? labelText;
  TextStyle? hintTextStyle;
  TextStyle? labelTextStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  ValueChanged<String>? onChange;
  onValidator? validator;
  TextInputType? keyboardType;
  bool? obscureText;
  TextEditingController? controller;
  int? maxLines;

  CustomTextFormField({
    super.key,
    this.borderSideColor = AppColor.grayColor,
    this.hintText,
    this.hintTextStyle,
    this.labelText,
    this.labelTextStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.onChange,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    required this.controller,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      maxLines: maxLines,
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: obscureText!,
      onChanged: onChange,
      controller: controller,
      style: Theme.of(context).textTheme.titleMedium,
      decoration: InputDecoration(
        enabledBorder: builtDecorationBorder(borderSideColor: borderSideColor),
        focusedBorder: builtDecorationBorder(borderSideColor: borderSideColor),
        errorBorder: builtDecorationBorder(borderSideColor: Colors.red),
        focusedErrorBorder: builtDecorationBorder(borderSideColor: Colors.red),
        hintText: hintText,
        hintStyle: hintTextStyle ?? AppStyle.medium14Black,
        labelText: labelText,
        labelStyle: labelTextStyle ?? AppStyle.medium14Black,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}

OutlineInputBorder builtDecorationBorder({required Color borderSideColor}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: borderSideColor, width: 2),
  );
}
