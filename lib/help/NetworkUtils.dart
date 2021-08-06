
class NetworkUtils {

  static String? getBaseUrl(String? url) {
    if (url == null || !url.startsWith("http")) return null;
    var index = url.indexOf("/", 9);
    if (index == -1) {
      return url;
    } else return url.substring(0, index);
  }
}