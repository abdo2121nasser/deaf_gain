import 'package:flutter/material.dart';
import '../values/app_size.dart';
import '../values/font_size.dart';
import 'general_text_form_field.dart';

class CustomFullInputBlock extends StatelessWidget {
  final String label;
  final Color textColor;
  final TextEditingController controller;
  final bool enableBorder;
  // final bool isNormalInput;
  final bool multiLine;
  final bool onlyInteger;
  final bool readOnly;
  final bool isVisible;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final VoidCallback? suffixIconFunction;
  final VoidCallback? prefixIconFunction;
  final String? hint;
  final String? Function(String?)? validator;


  const CustomFullInputBlock({
    super.key,
    required this.label,
    required this.textColor,
    required this.controller,
    this.readOnly = false,
    this.enableBorder = false,
    // this.isArabicTabView = false,
    // this.isNormalInput = false,
    this.multiLine = false,
    this.onlyInteger = false,
    this.isVisible = true,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixIconFunction,
    this.prefixIconFunction,
    this.hint,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: k16Sp,
            color: textColor,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(
          height: k5V,
        ),
        GeneralTextFormField(
          controller: controller,
          enableBorder: enableBorder,
          onlyInteger: onlyInteger,
          readOnly: readOnly,
          isVisible: isVisible,
          multiLine: multiLine,
          suffixIcon: suffixIcon,
          prefixIconFunction: prefixIconFunction,
          suffixIconFunction: suffixIconFunction,
          prefixIcon: prefixIcon,
          hint: hint,
          validator: validator,
        ),
      ],
    );
  }
}
