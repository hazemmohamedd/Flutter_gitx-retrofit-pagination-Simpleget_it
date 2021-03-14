import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pagination_retrofit_getx/init_api/api_client.dart';

final locator = GetIt.instance;
void setup(){
  locator.registerLazySingleton<ApiClient>(() => ApiClient(Dio(BaseOptions(contentType: "application/json"))));
}