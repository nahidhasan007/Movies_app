import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/model/image_model.dart';
import 'package:flutter_mvvm_architecture/res/app_url.dart';

import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiService.dart';

class ImagesViewModel extends ChangeNotifier {
  final BaseApiServices _apiServices = NetworkApiService();
  
  List<Picsum> _images = [];

  List<Picsum> get images => _images;

  Future<void> getImages() async {
    final response = await _apiServices.getGetApiResponse(AppUrl.picsum_images);
    if(response is List){
      _images = response.map((image) => Picsum.fromJson(image)).toList();
       notifyListeners();
    }
    else {
      throw("Invalid image parsing!!");
    }
  }
}
