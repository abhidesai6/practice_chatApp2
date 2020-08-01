import 'dart:io';
import 'package:image/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class Utils {
  static String getUsername(String email) {
    return "live:${email.split('@')[0]}";
  }

  static String getInitials(String name) {
    List<String> nameSplit = name.split(" ");
    String firstNameInitials = nameSplit[0][0];
    String lastNameInitials = nameSplit[1][0];
    return firstNameInitials + lastNameInitials;
  }

  static Future<File> pickImage({@required ImageSource source}) async {
    File selectedImage = await ImagePicker.pickImage(source: source);
    return selectedImage;
  }

  static Future<File> compressImage(File imageToCompress) async {}
}
