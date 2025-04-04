import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/services/validator_service.dart';
import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/component/custom_full_input_block.dart';

class CustomPasswordWidget extends StatefulWidget {
  final TextEditingController controller;

  const CustomPasswordWidget({
    super.key,
    required this.controller,
  });

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<CustomPasswordWidget> {
  final ValueNotifier<bool> _obscureText = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureText,
      builder: (context, obscure, child) {
        return CustomFullInputBlock(
          label: 'كلمه المرور',
          hint: 'ادخل كلمه المرور',
          validator: ValidatorService.validatePassword,
          color: kBlackColor,
          enableBorder: true,
          controller: widget.controller,
          prefixIcon: const Icon(
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
