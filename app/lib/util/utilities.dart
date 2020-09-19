class Utils {
  // ignore: prefer_expression_function_bodies
  static String getUsername(String email) {
    return "live:${email.split('@')[0]}";
  }
}
