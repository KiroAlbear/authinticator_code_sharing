class CommonValidators {
  static bool isValidInteger(String value) {
    return int.tryParse(value) != null;
  }

  static bool isValidEmail(String value) {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value);
  }

  // function for validating password that has at 1 character, 1 number, and a minimum of 8 characters
  static bool isValidPassword(String value) {
    return RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$').hasMatch(value);
  }
}
