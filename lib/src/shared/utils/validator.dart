import 'package:app_demo/src/shared/utils/email_validator.dart';

class Validator {
  static bool isValidEmail(String? value) {
    if (value == null) {
      return false;
    }
    if (value.isEmpty) {
      return false;
    }
    if (value.length < 4) {
      return false;
    }
    return EmailValidator.validate(value);
  }

  static bool isValidPassword(String? value) {
    if (value == null) {
      return false;
    }
    if (value.isEmpty) {
      return false;
    }
    if (value.length < 5) {
      return false;
    }
    // bool passValid = RegExp(
    //         "^(?=.{8,32}\$)(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$%^&*(),.?:{}|<>]).*")
    //     .hasMatch(value);
    // if(!passValid){
    //   return false;
    // }

    return true;
  }

  static bool isValidDayOfBirth(DateTime? value) {
    if (value == null || value.toIso8601String().isEmpty) return false;
    final now = DateTime.now();
    if (value.isAfter(now)) return false;
    final age =
        now.year -
        value.year -
        ((now.month < value.month ||
                (now.month == value.month && now.day < value.day))
            ? 1
            : 0);
    if (age <= 3) return false;
    return true;
  }

  static bool isValidValue(String? value) {
    if (value == null) {
      return false;
    }
    if (value.trim().isEmpty) {
      return false;
    }
    return true;
  }

   static bool isQuotaMessage(String msg) {
    final lower = msg.toLowerCase();
    return lower.contains('quota') ||
        lower.contains('resource_exhausted') ||
        lower.contains('429') ||
        lower.contains('rate limit');
  }
}
