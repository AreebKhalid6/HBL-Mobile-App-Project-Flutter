import 'dart:async';

import 'package:canteen_hub/Pages/cart.dart';
import 'package:canteen_hub/Utils/waiting_screens/screen_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.to(() => const Screen2());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 50),
              child: Center(
                child: Image.asset(
                  'assets/images/HBL.png',
                  height: 50,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Text(
                      'Preparing your food.',
                      style: GoogleFonts.raleway(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'assets/images/screen1.png',
                    height: 300,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
