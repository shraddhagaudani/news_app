import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/theme_controller.dart';

class Setting_page extends StatefulWidget {
  const Setting_page({super.key});

  @override
  State<Setting_page> createState() => _Setting_pageState();
}

class _Setting_pageState extends State<Setting_page> {
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GetBuilder<ThemeController>(
              builder: (_) {
                return ListTile(
                  tileColor: Colors.black12,
                  title: const Text("Theme Mode"),
                  trailing: IconButton(
                    onPressed: () {
                      themeController.changeTheme();
                    },
                    icon: (themeController.themeModel.isdark)
                        ? const Icon(
                            Icons.sunny,
                          )
                        : const Icon(
                            Icons.nightlight,
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
