import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override

  Widget build(BuildContext context) {
     Future.delayed(
      const Duration(seconds: 5),
      () => Get.offNamed('/topic_page'),
    );
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            Image.asset(
              "assets/images/bangluru.png",
              height: 320,
              width: 800,
            ),
            const Text(
              'N O W A V A I L A B L E I N ',
              style: TextStyle(
                color: Color(0xFF666262),
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '14  L A N G U A G E S',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const CircularProgressIndicator(
              color: Color(
                0xFF666262,
              ),
            ),
          ],
        ),
      ),
            );
  }
}
