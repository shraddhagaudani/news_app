import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_app/controllers/theme_controller.dart';
import 'package:news_app/helper/api_helper.dart';
import 'package:news_app/models/news_model.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  late Future<NewsModel?> getnews;

  @override
  void initState() {
    getnews = APIHelper.apiHelper.fetchAllNews(NewsCategory: "");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
 ThemeController themeController =   Get.find();
    return GetBuilder<ThemeController>(
    builder: (_){return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.toNamed('/setting_page');
                        },
                        icon: const Icon(Icons.list),
                      ),
                      // SizedBox(width: 10,),
                      Text(
                        'THE TIMES OF INDIA',
                        style: TextStyle(
                          color: (themeController.themeModel.isdark)?Colors.white:Colors.black,
                          fontSize: 22,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.person_pin_rounded),
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            Get.toNamed('/business_page');
                          },
                          child: const Text("Business"),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Get.toNamed('/health_page');
                          },
                          child: const Text("Health"),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Get.toNamed('/sports_page');
                          },
                          child: const Text("Sports"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: TextFormField(
                onChanged: (val) {
                  setState(() {
                    getnews = APIHelper.apiHelper.fetchAllNews(
                      NewsCategory: val,
                    );
                  });
                },
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  hintText: "Enter News Category",
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              flex: 12,
              child: FutureBuilder(
                future: getnews,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("ERROR:${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    NewsModel? data = snapshot.data;
                    print(data);
                    if (data == null) {
                      return const Center(
                        child: Text("No available data..."),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: data.articles.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
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
                                        color: (themeController.themeModel.isdark)?Colors.white:Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20,
                                        fontFamily: 'Inter',
                                      ),
                                    ),
                                  ),
                                  // Text(data.articles[i]['source']['name']),
                                  // (data.articles[i]['description'] != null)
                                  //     ? Text(
                                  //         data.articles[i]['description'],
                                  //         style: const TextStyle(
                                  //           fontSize: 15,
                                  //
                                  //
                                  //           fontFamily: 'Inter',
                                  //         ),
                                  //       )
                                  //     : const Text(
                                  //         "Business information comes in general surveys, data, articles, books, references, search-engines, and internal records that a business can use to guide its planning, operations, and the evaluation of its activities.",
                                  //         style: TextStyle(
                                  //           fontSize: 15,
                                  //
                                  //           fontFamily: 'Inter',
                                  //         ),
                                  //       )
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  (data.articles[i]['urlToImage'] == null)
                                      ? Image.asset("assets/images/news.png")
                                      : Image.network(
                                    data.articles[i]['urlToImage'],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            );
                          });
// return ListView.builder(itemCount: data.,itemBuilder: (context,i){});
                    }
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );},
    );
  }
}
