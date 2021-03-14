// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= Apis.BaseUrl;
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<PostsModel> getPosts(int page ) async {
    final queryParameters = <String, dynamic>{};
    queryParameters['page']=page;
    final _result = await _dio.request<Map<String, dynamic>>(Apis.users,
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            baseUrl: baseUrl),);
    final value = PostsModel.fromJson(_result.data);
    print(value);
    return value;
  }
}
