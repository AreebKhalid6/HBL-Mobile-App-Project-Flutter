import 'package:canteen_hub/Utils/foodtile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Utils/New_Morph_Box.dart';
import 'canteen_view.dart';

class TeaPage extends StatefulWidget {
  const TeaPage({Key? key}) : super(key: key);

  @override
  State<TeaPage> createState() => _TeaPageState();
}

class _TeaPageState extends State<TeaPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: (() {
                      Get.to(() => const CanteenView());
                    }),
                    child: NeumorphBox(
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Text(
                    'HBL ASSET HUB',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff009984),
                    ),
                  ),
                  CircleAvatar(
                    radius: 27.0,
                    backgroundColor: const Color(0xff009984),
                    child: Image.asset('assets/images/avatar.png'),
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
                  Stack(
                    children: [
                      Container(
                        height: 170,
                        width: double.infinity,
                        color: Colors.amber.shade200,
                        child: Image.asset(
                          'assets/images/teaHL.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 170.0,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Colors.black, Colors.transparent]),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Positioned(
                        top: 110.0,
                        left: 30.0,
                        child: Text(
                          'Tea',
                          style: GoogleFonts.raleway(
                              letterSpacing: 2,
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Get.bottomSheet(itemDetail());
                    },
                    child: const FoodTile(),
                  ),
                  InkWell(
                    onTap: () {
                      Get.bottomSheet(itemDetail());
                    },
                    child: const FoodTile(),
                  ),
                  InkWell(
                    onTap: () {
                      Get.bottomSheet(itemDetail());
                    },
                    child: const FoodTile(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget itemDetail() {
  return Container(
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        color: Colors.white),
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          child: Container(
            height: 200,
            width: double.infinity,
            color: Colors.amber,
            child: Image.asset(
              'assets/images/tea.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Tea',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                    ),
                    Text(
                      'Rs. 60.00',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 27,
                          color: Colors.red),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '1 cup of tea with sugar',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 22,
                          color: Colors.grey.shade700),
                    ),
                  ],
                ),
              ),
              Row(
                children: const [
                  Icon(
                    Icons.star,
                    size: 25,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    size: 25,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    size: 25,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    size: 25,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star_border,
                    size: 25,
                    color: Colors.yellow,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CircleAvatar(
                            backgroundColor: Color(0xffC5C5C5),
                            radius: 17,
                            child: Center(
                              child: Text(
                                '-',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                            ),
                          ),
                          const Text('0'),
                          CircleAvatar(
                            backgroundColor: const Color(0xff009984),
                            radius: 17,
                            child: Center(
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add,
                                    size: 18,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    NeumorphBox(
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                        child: Text(
                          'Add to cart',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
