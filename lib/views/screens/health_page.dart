import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_app/helper/api_helper.dart';
import 'package:news_app/models/news_model.dart';

class Health_page extends StatefulWidget {
  const Health_page({super.key});

  @override
  State<Health_page> createState() => _Health_pageState();
}

class _Health_pageState extends State<Health_page> {
  late Future<NewsModel?> gethealthnews;

  @override
  void initState() {
    gethealthnews = APIHelper.apiHelper.fetchAllNews(NewsCategory: "health");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Health News"),
      ),
      body: FutureBuilder(
          future: gethealthnews,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("ERROR:${snapshot.error}");
            } else if (snapshot.hasData) {
              NewsModel? data = snapshot.data;

              if (data == null) {
                return const Text(
                  "No Available data...",
                );
              } else {
                return ListView.builder(
                    itemCount: data.articles.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed('/details_page',
                                    arguments: data.articles[i]);
                              },
                              child: Text(
                                data.articles[i]['title'],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // (data.articles[i]['description'] != null)
                            //     ? Text(data.articles[i]['description'])
                            //     : const Text(
                            //   "Sports information comes in general surveys, data, articles, books, references, search-engines, and internal records that a business can use to guide its planning, operations, and the evaluation of its activities.",
                            //   style: TextStyle(color: Colors.grey),
                            // ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            (data.articles[i]['urlToImage'] == null)
                                ? Image.asset("assets/images/news.png")
                                : Image.network(
                              data.articles[i]['urlToImage'],
                            ),
                          ],
                        ),
                      );
                    });
              }
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
