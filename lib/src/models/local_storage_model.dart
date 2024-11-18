import 'package:universal_html/html.dart';

class LocalStorageModel {
  static Storage localStorage = window.localStorage;

  static void saveValue(String key, String value) {
    localStorage[key] = value;
  }

  static String? getValue(String key) {
    return localStorage[key];
  }

  static deleteValue(String key) {
    localStorage.remove(key);
  }

  static clearAll() {
    localStorage.clear();
  }
}
