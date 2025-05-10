class ValidatorService {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'من فضلك أدخل البريد الإلكتروني';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'من فضلك أدخل بريدًا إلكترونيًا صالحًا';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'من فضلك أدخل كلمة المرور';
    }

    // Minimum length 8
    if (value.length < 8) {
      return 'يجب أن تكون كلمة المرور مكونة من 8 أحرف على الأقل';
    }

    // At least one uppercase
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل';
    }

    // At least one lowercase
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'يجب أن تحتوي كلمة المرور على حرف صغير واحد على الأقل';
    }

    // At least one symbol (non-alphanumeric)
    if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>_\-\\\/~`+=;\[\]]').hasMatch(value)) {
      return 'يجب أن تحتوي كلمة المرور على رمز واحد على الأقل ';
    }


  // All checks passed
  return null;
}


  static String? validateConfirmPassword(String? value, String originalPassword) {
    if (value == null || value.isEmpty) {
      return 'من فضلك أكد كلمة المرور';
    }
    if (value != originalPassword) {
      return 'كلمة المرور غير متطابقة';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'من فضلك أدخل الاسم';
    }
    final nameRegex = RegExp(r"^[\u0600-\u06FFa-zA-Z\s]+$");
    if (!nameRegex.hasMatch(value)) {
      return 'يجب أن يحتوي الاسم على حروف ومسافات فقط';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'من فضلك أدخل رقم الهاتف';
    }

    final phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'من فضلك أدخل رقم هاتف صحيح';
    }
    return null;
  }
}
