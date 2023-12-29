import 'package:shared_preferences/shared_preferences.dart';

class Applocal {
  static String Image_Key = 'photo';

  static String Name_Key = 'name';
// // set
  static CacheData(String key, String value) async {
    var pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
  }

// get
  static Future<String> get(String key) async {
  var pref = await SharedPreferences.getInstance();
  return pref.getString(key) ?? '';
}
}
