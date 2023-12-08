class ValidatorHelper {
  String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please fill in your phone number";
    }

   RegExp phoneNumberRegExp = RegExp(r'^09\d+$');


    if (!phoneNumberRegExp.hasMatch(value)) {
      return "Invalid Myanmar phone number format";
    }

    return null;
  }

  String? addressValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please fill in your address";
    }

    return null;
  }

  String? cashValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please fill in your collect cash amount";
    }

    return null;
  }

  String? noteValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please fill in your note";
    }

    return null;
  }

  String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return "Please fill name";
    }

    return null;
  }

  String? loginPasswordValidator(String? value) {
    if (value!.isEmpty) {
      return "Please fill password";
    }
    return null;
  }

  String? signUpPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please fill in your password";
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain at least one uppercase letter";
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return "Password must contain at least one lowercase letter";
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return "Password must contain at least one digit";
    }
    if (!value.contains(RegExp(r'[!@#\$%^&]'))) {
      return "Password must contain at least one special character from '!@#\$%^&'";
    }
    if (value.length < 8) {
      return "Password must be at least 8 characters long";
    }

    return null;
  }
}
