import 'package:taski_to_do_challenge/app/core/values/utils.dart';

mixin ValidatorsMixin {
  String? isNotEmpty(String? value, [String? message]) {
    if (value?.trim().isEmpty ?? true) {
      return message ?? 'Required field';
    }
    return null;
  }

  String? isEqual(String? value, String? comparableValue, [String? message]) {
    if (value != comparableValue) return message ?? 'The field must be equal';
    return null;
  }

  String? isValidEmail(String? value, [String? message]) {
    if (!Utils.isValidEmail(value)) {
      return message ?? 'Please enter a valid email';
    }
    return null;
  }

  String? isValidPassword(String? value, [String? message]) {
    if ((value?.length ?? 0) < 6) {
      return message ?? 'The password must have at least 6 characters';
    }
    return null;
  }

  String? isFilled(String? value, int size, [String? message]) {
    if ((value?.length ?? 0) < size) {
      return message ?? 'The field must be fully filled';
    }
    return null;
  }

  String? combine(List<String? Function()> validators) {
    for (var validator in validators) {
      final result = validator();
      if (result != null) return result;
    }
    return null;
  }
}
