import 'package:json_annotation/json_annotation.dart';

enum PostsLoadMoreStatus { LOADING, STABLE }
@JsonSerializable()
class PostsModel {
  int code;
  Meta meta;
  List<Data> data;

  PostsModel({this.code, this.meta, this.data});

  PostsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meta {
  Pagination pagination;

  Meta({this.pagination});

  Meta.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pagination != null) {
      data['pagination'] = this.pagination.toJson();
    }
    return data;
  }
}

class Pagination {
  int total;
  int pages;
  int page;
  int limit;

  Pagination({this.total, this.pages, this.page, this.limit});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    pages = json['pages'];
    page = json['page'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['pages'] = this.pages;
    data['page'] = this.page;
    data['limit'] = this.limit;
    return data;
  }
}

class Data {
  int id;
  int userId;
  String title;
  String body;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
        this.userId,
        this.title,
        this.body,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    body = json['body'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['body'] = this.body;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}