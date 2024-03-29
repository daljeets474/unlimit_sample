// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiclient.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ApiClient implements ApiClient {
  _ApiClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://geek-jokes.sameerkumar.website/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<JokeResponseModel> getJoke(format) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'format': format};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<JokeResponseModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JokeResponseModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
