
bool isEmail(String email) {
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
  return emailRegex.hasMatch(email);
}

bool isPassword(String password) {
  // Define your password val1idation rules here
  // For example, at least 8 characters long with at least one uppercase letter and one digit
  final passwordRegex = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  return passwordRegex.hasMatch(password);
}