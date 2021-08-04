
extension StringExtensions on String? {

  bool isJsonObject() {
    if (null == this) return false;
    String str = this!.trim();
    return str.startsWith('{') && str.endsWith('}');
  }

  bool isJsonArray() {
    if (null == this) return false;
    String str = this!.trim();
    return str.startsWith('[') && str.endsWith(']');
  }
}