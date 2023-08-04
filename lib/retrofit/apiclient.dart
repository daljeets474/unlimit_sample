
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../model/joke_response_model.dart';
import 'api_interface.dart';

part 'apiclient.g.dart';

@RestApi(baseUrl: ApiInterface.url)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;


  @GET(ApiInterface.getJoke)
  Future<JokeResponseModel> getJoke(
      @Query("format") String format);

}