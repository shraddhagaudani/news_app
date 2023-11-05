import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/models/theme_model.dart';

import '../utills.dart';

class ThemeController extends GetxController {
  ThemeModel themeModel = ThemeModel(isdark: box.read('isDarkMode') ?? false);

  changeTheme() {
    box.write('isDarkMode', themeModel.isdark = !themeModel.isdark);
    (themeModel.isdark)
        ? Get.changeTheme(
            ThemeData(useMaterial3: true, brightness: Brightness.light))
        : Get.changeTheme(
            ThemeData(useMaterial3: true, brightness: Brightness.dark));
    update();
  }
}
