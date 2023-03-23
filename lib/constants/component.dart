import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;
String? id;

void cacheData() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  id = pref.getString("user_id");
}
