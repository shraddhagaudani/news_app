import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:news_app/views/screens/business_page.dart';
import 'package:news_app/views/screens/city_page.dart';
import 'package:news_app/views/screens/details_page.dart';
import 'package:news_app/views/screens/health_page.dart';
import 'package:news_app/views/screens/home_page.dart';
import 'package:news_app/views/screens/langauages_page.dart';
import 'package:news_app/views/screens/splash_screen.dart';
import 'package:news_app/views/screens/sports_page.dart';
import 'package:news_app/views/screens/topic_page.dart';

void main() {
  runApp(
    GetMaterialApp(initialRoute: '/',
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => const Home_page()),
        GetPage(name: '/splash_screen', page: () => const Splash_screen()),
        GetPage(name: '/topic_page', page: () => const Topic_page()),
        GetPage(name: '/city_page', page: () => const City_page()),
        GetPage(name: '/languages_page', page: () => const Languages_page()),
        GetPage(name: '/business_page', page: () => const Business_page()),
        GetPage(name: '/health_page', page: () => const Health_page()),
        GetPage(name: '/sports_page', page: () => const Sports_page()),
        GetPage(name: '/details_page', page: () => const Details_page()),
      ],
    ),
  );
}
