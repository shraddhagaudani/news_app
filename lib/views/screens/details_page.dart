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
    Map data = Get.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                data['title'],
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 22,
                  fontFamily: 'Inter',
                ),
              ),

              (data['urlToImage'] == null)
                  ? Image.asset("assets/images/news.png")
                  : Image.network(
                      data['urlToImage'],
                      height: 250,
                      width: 400,
                    ),
              const SizedBox(
                height: 5,
              ),
              const Row(
                children: [
                  Text(
                    "Description:",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Inter'),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              (data['description'] != null)
                  ? Text(
                      data['description'],
                      style: const TextStyle(
                        fontSize: 17,
                        fontFamily: 'Inter',
                      ),
                    )
                  : const Text(
                      "Business information comes in general surveys, data, articles, books, references, search-engines, and internal records that a business can use to guide its planning, operations, and the evaluation of its activities.",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Inter',
                      ),
                    ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Text(
                    "Content:",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Inter'),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              (data['content'] == null)
                  ? Text(
                      "Business journalism is the part of journalism that tracks, records, analyzes and interprets the business, economic and financial activities and changes that take place in societies. Topics widely cover the entire purview of all commercial activities related to the economy",
                      style: TextStyle(fontSize: 17))
                  : Text(
                      data['content'],
                      style: TextStyle(fontSize: 17),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
