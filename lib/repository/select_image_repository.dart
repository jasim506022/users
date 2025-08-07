import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../res/app_function.dart';

class SelectImageRepository {
  final ImagePicker _imagepicker = ImagePicker();

  Future<File> captureImageSingle({required ImageSource imageSource}) async {
    try {
      XFile? captureImage = await _imagepicker.pickImage(source: imageSource);
      if (captureImage == null) {
        AppsFunction.flutterToast(
            msg: "No image selected or operation was canceled.");
      }
      return File(captureImage!.path);
    } catch (e) {
      AppsFunction.handleException(e);
      rethrow;
    }
  }
}
