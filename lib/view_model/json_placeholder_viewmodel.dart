import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_architecture/res/app_url.dart';
import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiService.dart';
import '../model/posts.dart';

class JsonPlaceholderViewModel extends ChangeNotifier {
  BaseApiServices _apiServices = NetworkApiService();
  List<Post> _posts = [];

  List<Post> get posts => _posts;

  Future<void> fetchPosts() async {
    final response = await _apiServices.getGetApiResponse(AppUrl.posts);
    print("$response");
    if (response is List) {
      _posts = response.map((item) => Post.fromJson(item)).toList();
      notifyListeners();
    } else {
      print("$response");
      throw Exception("Failed to load posts");
    }
  }
}
