import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/joke_model.dart';

class Utils {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();
  static String jokeListKey = "jokes";

  static void saveList(List<JokeModel> jokeList) async {
    final SharedPreferences prefs = await _prefs;
    String rawJson = jsonEncode(jokeList);
    await prefs.setString(jokeListKey, rawJson);

    getList();
  }

  static Future<List<JokeModel>?>? getList() async {
    List<JokeModel> jokeList =[];
    final SharedPreferences prefs = await _prefs;
    final rawJson = prefs.getString(jokeListKey);
    if (rawJson != null) {
      var mapV = jsonDecode(rawJson);
      jokeList = List<JokeModel>.from(
        mapV.map((model) {
          return JokeModel.fromJson(model);
        }),
      );
    }
    return jokeList;
  }
}
