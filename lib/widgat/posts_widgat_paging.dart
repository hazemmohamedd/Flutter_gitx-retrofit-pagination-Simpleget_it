import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pagination_retrofit_getx/dependaency_injection/locator.dart';
import 'package:pagination_retrofit_getx/init_api/api_client.dart';
import 'package:pagination_retrofit_getx/model/data_model.dart';
class PostPagination extends StatefulWidget {
  final PostsModel Posts;

  PostPagination(this.Posts);

  @override
  _PostPaginationState createState() => _PostPaginationState();
}

class _PostPaginationState extends State<PostPagination> {
  PostsLoadMoreStatus loadMoreStatus = PostsLoadMoreStatus.STABLE;
  final ScrollController scrollController = new ScrollController();
  List<Data> Posts;
  int currentPageNumber;

  @override
  void initState() {
    Posts = widget.Posts.data;
    currentPageNumber = widget.Posts.meta.pagination.page;
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return NotificationListener(
        onNotification: onNotificationPosts,
        child: new ListView.builder(
            padding: EdgeInsets.only(top: 5.0),
            controller: scrollController,
            itemCount: Posts.length,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return init_Data(Posts[index]);
            }));
  }

  bool onNotificationPosts(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      if (scrollController.position.maxScrollExtent > scrollController.offset &&
          scrollController.position.maxScrollExtent - scrollController.offset <=
              40) {
        if (loadMoreStatus != null &&
            loadMoreStatus == PostsLoadMoreStatus.STABLE) {
          loadMoreStatus = PostsLoadMoreStatus.LOADING;

          locator.get<ApiClient>().getPosts(currentPageNumber + 1)
              .then((moviesObject) {
            currentPageNumber = moviesObject.meta.pagination.page;
            loadMoreStatus = PostsLoadMoreStatus.STABLE;
            setState(() => Posts.addAll(moviesObject.data));
          });
        }
      }
    }
    return true;
  }


  Widget init_Data(Data posts) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.account_box,
          color: Colors.green,
          size: 50,
        ),
        title: Text(
          posts.title,
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(posts.id.toString()),
      ),
    );
  }
}
