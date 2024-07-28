mixin AuthInputValidationMixin {
  static final RegExp _firstNameRegExp = RegExp(
    r"^[A-Z][a-z]*$",
  );
  static final RegExp _lastNameRegExp = RegExp(
    r"^[A-Z][a-z]*$",
  );
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  static final RegExp _usernameRegExp = RegExp(
    r'^[a-zA-Z0-9_]{3,20}$',
  );
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$%^&*]).{8,}$',
  );

  static String? isFirstNameValid(String? firstName) {
    if (firstName == null || firstName.isEmpty) {
      return "First name cannot be empty";
    }
    if (firstName.length < 3) {
      return "First name should be at least 3 characters long";
    }
    if (!_firstNameRegExp.hasMatch(firstName)) {
      return "First name must start with an uppercase and be alphabetic.";
    }
    return null;
  }

  static String? isLastNameValid(String? lastName) {
    if (lastName == null || lastName.isEmpty) {
      return "Last name cannot be empty";
    }
    if (lastName.length < 3) {
      return "Last name should be at least 3 characters long";
    }
    if (!_lastNameRegExp.hasMatch(lastName)) {
      return "Last name must start with an uppercase and be alphabetic.";
    }
    return null;
  }

  static String? isEmailValid(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email cannot be empty';
    }
    if (!_emailRegExp.hasMatch(email)) {
      return 'Enter a valid email address';
    }
    return null; // Return null if no validation errors
  }

  static String? isUsernameValid(String? username) {
    if (username == null || username.isEmpty) {
      return 'Username cannot be empty';
    }
    if (username.length < 3 || username.length > 20) {
      return 'Username must be 3-20 characters';
    }
    if (!_usernameRegExp.hasMatch(username)) {
      return 'Username must have only letters, numbers, and underscores.';
    }
    return null; // Return null if no validation errors
  }

  static String? isPasswordValid(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password cannot be empty';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!_passwordRegExp.hasMatch(password)) {
      return 'Password needs upper, lower, digit, and special character.';
    }
    return null; // Return null if no validation errors
  }

  static String? isConfirmPasswordValid(
      String? confirmPassword, String password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm password cannot be empty';
    }
    if (confirmPassword != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? isOtpCodeValid(String? otpCode) {
    if (otpCode == null || otpCode.isEmpty) {
      return 'OTP code cannot be empty';
    }
    if (otpCode.length != 6) {
      return 'OTP code must be 6 characters long';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(otpCode)) {
      return 'OTP code only contains numbers';
    }
    return null;
  }
}
