
import 'dart:convert';

class GSON {

  static String? toJson(Object object) {
    return new JsonEncoder().convert(object);
  }

  static Map<String, dynamic> fromJson(String json) {
    return new JsonDecoder().convert(json);
  }

  static Map<String, dynamic> fromJsonObject(String json) {
    return new JsonDecoder().convert(json);
  }
}