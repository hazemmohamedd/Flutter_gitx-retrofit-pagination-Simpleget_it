import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination_retrofit_getx/getx/init_data.dart';
import 'package:pagination_retrofit_getx/model/data_model.dart';

import 'posts_widgat_paging.dart';

const int FirstPage=1;
class Myposts extends GetWidget<Data_initialization>{

  _tryAgainButtonClick(){
    print("Errrro");
  }
  Widget Progress(){
    return Center(child:Center(child: CircularProgressIndicator()),);
  }
  Widget Sucess(PostsModel dataModel){
    return PostPagination(dataModel);
  }
  @override
  Widget build(BuildContext context) {
 return controller.buildBody(context, FirstPage, Sucess, Progress(), _tryAgainButtonClick);
  }
}