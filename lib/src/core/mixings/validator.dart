
// IMPLEMENTACION DEL MIXING PARA LAS VALIDACIONES

mixin Validator {
  // VALIDACION DEL EMAIL
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  // VALIDACION DEL PASSWORD
  String? validatePassword(String? value) {
    const minLength = 8;

    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < minLength) {
      return 'Password must be at least $minLength characters long';
    }

    return null;
  }

  // CONFIRMACION DEL PASSWORD
  String? validateConfirmPassword(String? value, String? original) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value != original) {
      return 'Passwords do not match';
    }

    return null;
  }
}
