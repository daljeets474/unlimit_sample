import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:unlimit_sample/model/joke_model.dart';
import 'package:unlimit_sample/model/joke_response_model.dart';
import '../retrofit/apiclient.dart';
import '../util/utils.dart';

class JokeProvider with ChangeNotifier {
  List<JokeModel> jokeList = [];

  Future<void> getJoke(BuildContext context) async {
    final dio = Dio(); // Provide a dio instance
    dio.options.headers["content-type"] =
        "application/json"; // config your dio headers globally
    final client = ApiClient(dio);
    client.getJoke('json').then((it) {
      afterJokeFetch(it, context);
    });
  }

  void afterJokeFetch(
      JokeResponseModel jokeResponseModel, BuildContext context) {
    if (jokeResponseModel != null) {
      int timestamp = DateTime.now().millisecondsSinceEpoch;
      JokeModel jokeModel =
          JokeModel(jokeResponseModel: jokeResponseModel, timeStamp: timestamp);
      if (jokeList.length < 10) {
        jokeList.add(jokeModel);
        notifyListeners();
      } else {
        jokeList.sort((a, b) => a.compareTo(b));
        jokeList.remove(jokeList.first);
        jokeList.add(jokeModel);
        notifyListeners();
      }
      Utils.saveList(jokeList);
      loadNextJoke(context);
    }
  }

  void loadNextJoke(BuildContext context) {
    Future.delayed(
        const Duration(milliseconds: 60000), () => {getJoke(context)});
  }

  void getJokeFromSp()async  {
    jokeList = (await Utils.getList())!;
    notifyListeners();
  }
}
