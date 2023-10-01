import 'package:flutter/material.dart';

class Sports_page extends StatefulWidget {
  const Sports_page({super.key});

  @override
  State<Sports_page> createState() => _Sports_pageState();
}

class _Sports_pageState extends State<Sports_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sports Page"),),
    );
  }
}
