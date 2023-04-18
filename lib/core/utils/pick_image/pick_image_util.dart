import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class PickImageUtil {
  final ImagePicker imagePicker = ImagePicker();
  final ImageCropper imageCropper = ImageCropper();
  Future<File?> pickImage(ImageSource imageSource) async {
    try {
      final tempXFile = await imagePicker.pickImage(source: imageSource);
      if (tempXFile != null) {
        final tempFile = File(tempXFile.path);
        final croppedFile = await _cropImageFunction(tempFile);
        if (croppedFile != null) {
          return File(croppedFile.path);
        } else {
          return null;
        }
      }
      return null;
    } catch (e, stackTrace) {
      log(e.toString());
      log(stackTrace.toString());
      throw Exception(e);
    }
  }

  Future<CroppedFile?> _cropImageFunction(File tempFile) async {
    final croppedFile = await ImageCropper().cropImage(
      uiSettings: [
        AndroidUiSettings(
          hideBottomControls: true,
          backgroundColor: Colors.white,
        ),
        IOSUiSettings(
          rotateClockwiseButtonHidden: true,
          aspectRatioPickerButtonHidden: true,
          hidesNavigationBar: true,
          rotateButtonsHidden: true,
        )
      ],
      sourcePath: tempFile.path,
      compressQuality: 100,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
    );
    return croppedFile;
  }
}
