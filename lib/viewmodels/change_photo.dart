import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChangePhotoViewmodel extends ChangeNotifier {
  final ImagePicker _picker = ImagePicker();

  String? imgPath;

  Future<void> chooseImageInGallery() async {
    final XFile? imageFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (imageFile != null) {
      imgPath = imageFile.path;
      notifyListeners();
    }
  }

  Future<void> chooseImageInCamera() async {
    final XFile? imageFile = await _picker.pickImage(
      source: ImageSource.camera,
    );
    if (imageFile != null) {
      imgPath = imageFile.path;
      notifyListeners();
    }
  }
}
