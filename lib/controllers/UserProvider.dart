import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallerymobile/models/UserModel.dart';
import 'package:image_picker/image_picker.dart';

class UserProvider extends ChangeNotifier {
  UserModel? userModel;

  void saveUser(String Name, String Username) {
    userModel = UserModel(name: Name, url: image!, Username: Username);
    notifyListeners();
  }

  ImagePicker imagePicker = ImagePicker();
  String? image;

  pickImage() async {
    XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
    if (file != null) {
      image = file.path;
      notifyListeners();
    }
  }
}
