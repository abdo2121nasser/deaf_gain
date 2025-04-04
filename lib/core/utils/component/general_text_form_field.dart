
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/colors.dart';
import '../values/app_size.dart';
import '../values/font_size.dart';

class GeneralTextFormField extends StatelessWidget {
  final bool onlyInteger;
  final TextEditingController? controller;
  final bool enableBorder;
  final bool multiLine;
  final bool isArabic;
  final bool readOnly;
  final String? hint;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final VoidCallback? suffixIconFunction;
  final VoidCallback? prefixIconFunction;
  final bool isVisible;
  final String? Function(String?)? validator;

  const GeneralTextFormField({
    super.key,
    this.onlyInteger = false,
    required this.controller,
    this.enableBorder = false,
    this.multiLine = false,
    this.isArabic = false,
    this.readOnly = false,
    this.isVisible = true,
    this.hint,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixIconFunction,
    this.prefixIconFunction,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      readOnly: readOnly,
      minLines: multiLine ? 1 : null,
      maxLines: multiLine ? 5 : 1, // Set maxLines to 4 if multiline is enabled
      keyboardType: multiLine ? TextInputType.multiline : null,
      textAlign: isArabic ? TextAlign.end : TextAlign.start,
      obscureText: !isVisible,
      inputFormatters: <TextInputFormatter>[
        if (onlyInteger)
          FilteringTextInputFormatter.allow(
            RegExp(
                r'^[\u0660-\u0669\u0030-\u0039]*\.?[\u0660-\u0669\u0030-\u0039]*$'),
          ),
      ],

      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: k14H, vertical: k10V),
        fillColor: kWhiteColor,
        filled: true,
        hintText: hint,
        hintStyle: TextStyle(color: kGreyColor, fontSize: k14Sp),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(k12R),
          ),
          borderSide: BorderSide(
            width: k1H,
            color: kRedColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(k12R),
          ),
          borderSide: BorderSide(
            width: k1H,
            color: kRedColor,
          ),
        ),
        enabledBorder: enableBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(k12R),
                ),
                borderSide: BorderSide(
                  width: k1H,
                  color: kGreyColor,
                ),
              )
            : null,
        focusedBorder: enableBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(k12R),
                ),
                borderSide: BorderSide(
                  width: k1H,
                  color: kGreyColor,
                ),
              )
            : null,
        suffixIcon: suffixIcon != null
            ? InkWell(
                onTap: () {
                  if (suffixIconFunction != null) {
                    suffixIconFunction!(); // Call the function safely
                  }                },
                child: suffixIcon,
              )
            : null,
        prefixIcon: prefixIcon != null
            ? InkWell(
                onTap: () {
                  if (prefixIconFunction != null) {
                    prefixIconFunction!(); // Call the function safely
                  }                },
                child: prefixIcon,
              )
            : null,
      ),
    );
  }
}
