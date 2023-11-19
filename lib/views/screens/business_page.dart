import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_app/controllers/theme_controller.dart';
import 'package:news_app/helper/api_helper.dart';

import '../../models/news_model.dart';

class Business_page extends StatefulWidget {
  const Business_page({super.key});

  @override
  State<Business_page> createState() => _Business_pageState();
}

class _Business_pageState extends State<Business_page> {
  late Future<NewsModel?> getbussinessnews;

  @override
  void initState() {
    getbussinessnews = APIHelper.apiHelper.fetchAllNews(NewsCategory: "business");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   ThemeController themeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Business Page"),
      ),
      body: FutureBuilder(
          future: getbussinessnews,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("ERROR:${snapshot.error}");
            } else if (snapshot.hasData) {
              NewsModel? data = snapshot.data;

              if (data == null) {
                return const Text("No Available data...");
              } else {
                return ListView.builder(
                    itemCount: data.articles.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
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
                                  style:  TextStyle(
                                    color:(themeController.themeModel.isdark)?Colors.white:Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // (data.articles[i]['description'] != null)
                              //     ? Text(data.articles[i]['description'],style: TextStyle(fontSize: 18),)
                              //     : const Text(
                              //         "Business information comes in general surveys, data, articles, books, references, search-engines, and internal records that a business can use to guide its planning, operations, and the evaluation of its activities.",
                              //      style: TextStyle(fontSize: 18), ),
                              //
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
                        ),
                      );
                    });
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
