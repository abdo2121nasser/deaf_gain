import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/services/validator_service.dart';
import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/component/custom_full_input_block.dart';

class CustomPasswordWidget extends StatefulWidget {
  final TextEditingController controller;
  final bool isConfirm;
  final TextEditingController? originalPasswordController;

  const CustomPasswordWidget({
    super.key,
    required this.controller,
    this.isConfirm = false,
    this.originalPasswordController,
  });

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<CustomPasswordWidget> {
  final ValueNotifier<bool> _obscureText = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureText,
      builder: (context, obscure, child) {
        return CustomFullInputBlock(
          label: widget.isConfirm ? 'تأكيد كلمة المرور' : 'كلمة المرور',
          hint: widget.isConfirm ? 'أدخل تأكيد كلمة المرور' : 'أدخل كلمة المرور',
          validator: widget.isConfirm
              ? (value) => ValidatorService.validateConfirmPassword(
            value,
            widget.originalPasswordController?.text ?? '',
          )
              : ValidatorService.validatePassword,
          textColor: kBlackColor,
          enableBorder: true,
          controller: widget.controller,
          prefixIcon: Icon(
            CupertinoIcons.lock,
            color: kDarkBlueColor,
          ),
          suffixIcon: obscure
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
          suffixIconFunction: () {
            _obscureText.value = !obscure;
          },
          isVisible: obscure,
        );
      },
    );
  }

  @override
  void dispose() {
    _obscureText.dispose();
    super.dispose();
  }
}
