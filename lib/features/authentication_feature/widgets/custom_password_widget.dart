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
          key: const ValueKey('password_field'),
          label: 'Password',
          validator: ValidatorService.validatePassword,
          color: kBlackColor,
          controller: widget.controller,
          enableBorder: true,
          hint: 'Your Password',
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

