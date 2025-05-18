import 'package:flutter/material.dart';
import 'package:gallerymobile/models/ImageModel.dart';

class ImageProviderr extends ChangeNotifier {
  final List<ImageModel> images = [
    ImageModel("image 1", "assets/cover.png", "decription", "small.mp3"),
    ImageModel("image 2", "assets/cover.png", "decription", "small.mp3"),
    ImageModel("image 3", "assets/cover.png", "decription", "small.mp3"),
  ];

  List<ImageModel> get items => images;
}
