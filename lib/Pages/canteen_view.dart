import 'dart:ffi';
import 'package:canteen_hub/Pages/Login.dart';
import 'package:canteen_hub/Pages/cart.dart';
import 'package:canteen_hub/Pages/homePage.dart';
import 'package:canteen_hub/Pages/profile.dart';
import 'package:canteen_hub/Pages/tea.dart';
import 'package:canteen_hub/Utils/New_Morph_Box.dart';
import 'package:canteen_hub/components/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popup_card/popup_card.dart';

class CanteenView extends StatelessWidget {
  const CanteenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => const HomePage());
                    },
                    child: NeumorphBox(
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    'HBL ASSET HUB',
                    style: GoogleFonts.raleway(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff009984),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const ProfilePage());
                    },
                    child: CircleAvatar(
                      radius: 27.0,
                      backgroundColor: const Color(0xff009984),
                      child: Image.asset('assets/images/avatar.png'),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Image.asset('assets/images/logo.png'),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35.0),
                    child: Row(
                      children: [
                        Text(
                          'Discover',
                          style: GoogleFonts.raleway(
                            fontSize: 50,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Choose the',
                              style: GoogleFonts.raleway(
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              'Food you love',
                              style: GoogleFonts.raleway(
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Column(
                    children: [
                      CategoryBox(
                        name: 'Tea',
                        image: 'teaHL',
                        onTap: () {
                          Get.to(() => const TeaPage());
                        },
                      ),
                      CategoryBox(
                        name: 'Coffee',
                        image: 'coffeeHL',
                        onTap: () {},
                      ),
                      CategoryBox(
                        name: 'Biscuit',
                        image: 'biscuitsHL',
                        onTap: () {},
                      ),
                      CategoryBox(
                        name: 'Chips',
                        image: 'chipsHL',
                        onTap: () {},
                      ),
                      CategoryBox(
                        name: 'Cakes',
                        image: 'cakesHL',
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff009984),
          onPressed: () {
            Get.to(() => const Cart());
          },
          child: const Icon(
            Icons.shopping_bag_outlined,
            size: 32,
          ),
        ),
      ),
    );
  }
}
