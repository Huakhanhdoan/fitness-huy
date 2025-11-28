class EmailValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    // Add more validation logic as needed
    return null;
  }
}
