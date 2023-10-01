import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Details_page extends StatefulWidget {
  const Details_page({super.key});

  @override
  State<Details_page> createState() => _Details_pageState();
}

class _Details_pageState extends State<Details_page> {
  
  @override
  Widget build(BuildContext context) {
  Map data =   Get.arguments as Map;
    return Scaffold(
      body: Column(
        children: [
        Text(data['title']),
        SizedBox(height: 20,),
        Text(data['content']),
        ],
      ),
    );
  }
}
