class JsonUtils {
  static Map<String, dynamic> dealBoolToInt(Map<String, dynamic> json) {
    json.forEach((key, value) {
      if (value is bool) {
        json[key] = value ? 1 : 0;
      }
    });
    return json;
  }
}
