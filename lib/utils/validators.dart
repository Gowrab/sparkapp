class Validator {
  String? validateEmpty({String field = '', required String? value}) {
    return value == null || value.isEmpty ? 'Please enter $field' : null;
  }

  String? validateEmail(String email) {
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return 'Email is invalid';
    }
    return null;
  }

  String? validatePasswordMatch(
      {required String password, required String confirmPassword}) {
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }
}
