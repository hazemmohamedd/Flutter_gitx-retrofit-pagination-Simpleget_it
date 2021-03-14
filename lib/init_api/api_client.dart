
import 'package:dio/dio.dart';
import 'package:pagination_retrofit_getx/model/data_model.dart';

import 'package:retrofit/http.dart';

import 'api.dart';

part 'api_client.g.dart';


@RestApi(baseUrl: Apis.BaseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(Apis.users)
  Future<PostsModel> getPosts(
      @Query("page") int page,
      );
}
