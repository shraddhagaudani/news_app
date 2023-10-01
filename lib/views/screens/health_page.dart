import 'package:flutter/material.dart';

class Health_page extends StatefulWidget {
  const Health_page({super.key});

  @override
  State<Health_page> createState() => _Health_pageState();
}

class _Health_pageState extends State<Health_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Health Page"),
      ),
    );
  }
}
