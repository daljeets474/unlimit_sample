class JokeResponseModel{
  String? joke;

  JokeResponseModel({this.joke});

  factory JokeResponseModel.fromJson(Map<String, dynamic> json) {
    return JokeResponseModel(
      joke: json['joke'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'joke': joke,
    };
  }
}