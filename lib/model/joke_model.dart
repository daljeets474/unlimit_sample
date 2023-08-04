import 'package:unlimit_sample/model/joke_response_model.dart';

class JokeModel {
  JokeResponseModel? jokeResponseModel;
  int? timeStamp;

  JokeModel({this.jokeResponseModel, this.timeStamp});

  factory JokeModel.fromJson(Map<String, dynamic> json) {
    return JokeModel(
      jokeResponseModel: JokeResponseModel.fromJson(json['jokeResponseModel']),
      timeStamp: json['timeStamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'jokeResponseModel': jokeResponseModel, 'timeStamp': timeStamp};
  }

  @override
  int compareTo(JokeModel other) {
    if (timeStamp! < other.timeStamp!) {
      return -1;
    } else if (timeStamp! > other.timeStamp!) {
      return 1;
    } else {
      return 0;
    }
  }
}
