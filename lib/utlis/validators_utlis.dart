class ValidationUtil {
  static bool isValidEmailId(String email) {
    RegExp regExp = RegExp(
        "^(([^<>()\\[\\]\\\\.,;:\\s@\"]+(\\.[^<>()\\[\\]\\\\.,;:\\s@\"]+)*)|(\".+\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))\$");
    return regExp.hasMatch(email);
  }
}

class ValidationItem {
final String? value;
final String? error;

ValidationItem(this.value, this.error);
}