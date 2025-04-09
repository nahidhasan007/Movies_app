import 'dart:ffi';

class Post {
  int? userId;
  int? id;
  String? title;
  String? body;

  Post({required this.userId, this.id, this.title, this.body});

  Post.fromJson(Map<String, dynamic> json){
    userId = json['userid'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Post.toJson(Map<String, dynamic> data) {
    data['userid'] = userId?? 0;
    data['id'] = id?? 0;
    data['title'] = title?? "";
    data['body'] = body?? 0;
  }

}
