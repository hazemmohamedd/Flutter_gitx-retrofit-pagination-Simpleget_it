import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:pagination_retrofit_getx/commonWidgets/placeholder_content.dart';
import 'package:pagination_retrofit_getx/dependaency_injection/locator.dart';
import 'package:pagination_retrofit_getx/init_api/api_client.dart';
import 'package:pagination_retrofit_getx/model/data_model.dart';



class Data_initialization extends GetxController {

  final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  FutureBuilder<PostsModel> buildBody(BuildContext context,int FirstPage,Widget s(PostsModel posts),Widget progress,Function tryAgainButtonClick ) {
    return FutureBuilder<PostsModel>(
        future:locator.get<ApiClient>().getPosts(FirstPage),
        builder: (context, snapshots) {
          if (snapshots.hasError)
            return PlaceHolderContent(
              title: "Problem Occurred",
              message: "Internet not connect try again",
              tryAgainButton: tryAgainButtonClick,
            );
          switch (snapshots.connectionState) {
            case ConnectionState.waiting:
              return progress;
            case ConnectionState.done:
              return s(snapshots.data);
            default:
          }
          update();
        }
        );
  }

  }



