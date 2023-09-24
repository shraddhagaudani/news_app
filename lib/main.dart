import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:news_app/views/screens/city_page.dart';
import 'package:news_app/views/screens/home_page.dart';
import 'package:news_app/views/screens/splash_screen.dart';
import 'package:news_app/views/screens/topic_page.dart';

void main() {
  runApp(
    GetMaterialApp(initialRoute: '/city_page',
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => const Home_page()),
        GetPage(name: '/splash_screen', page: () => const Splash_screen()),
        GetPage(name: '/topic_page', page: () => const Topic_page()),
        GetPage(name: '/city_page', page: () => const City_page()),
      ],
    ),
  );
}
