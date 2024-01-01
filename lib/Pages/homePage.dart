import 'package:canteen_hub/Pages/job_details.dart';
import 'package:canteen_hub/Pages/profile.dart';
import 'package:canteen_hub/Utils/job_post_card.dart';
import 'package:canteen_hub/Utils/side_menu.dart';
import 'package:canteen_hub/components/my_footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:get/get.dart';

import '../Utils/New_Morph_Box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _globalKey,
        drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.65,
          child: const SideMenu(),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      _globalKey.currentState?.openDrawer();
                      // Get.to(() => const Login());
                    },
                    child: NeumorphBox(
                        child: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    )),
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
                      child: Center(
                        child: Image.asset(
                          'assets/images/avatar.png',
                        ),
                      ),
                    ),
                  ),
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
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        Text(
                          'Find',
                          style: GoogleFonts.raleway(
                            fontSize: 50,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        Text(
                          'Your Dream Job',
                          style: GoogleFonts.raleway(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        Text(
                          'In ',
                          style: GoogleFonts.raleway(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'HBL',
                          style: GoogleFonts.raleway(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xff009984),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      height: 180,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/hblBuilding.png'),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Opacity(
                            opacity: 0.7,
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xff00E1C2),
                                      Color(0xff009984),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                              ),
                            ),
                          ),
                          CarouselSlider(
                            unlimitedMode: true,
                            enableAutoSlider: true,
                            autoSliderTransitionTime:
                                const Duration(seconds: 3),
                            autoSliderDelay: const Duration(seconds: 7),
                            slideTransform: const TabletTransform(),
                            slideIndicator: CircularSlideIndicator(
                              padding: const EdgeInsets.only(bottom: 10),
                              indicatorRadius: 5,
                              itemSpacing: 13,
                              indicatorBackgroundColor: const Color(0xff006A5C),
                              currentIndicatorColor: const Color(0xffffffff),
                            ),
                            children: [
                              Center(
                                child: Image.asset(
                                    'assets/images/sliderImage.png'),
                              ),
                              Center(
                                child: Image.asset(
                                    'assets/images/sliderImage.png'),
                              ),
                              Center(
                                child: Image.asset(
                                    'assets/images/sliderImage.png'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  JobPostCard(
                    jobTitle: 'IT Manager',
                    onTap: () {
                      Get.to(() => const JobDetailView());
                    },
                  ),
                  JobPostCard(
                    jobTitle: 'Accountant',
                    onTap: () {
                      Get.to(() => const JobDetailView());
                    },
                  ),
                  JobPostCard(
                    jobTitle: 'Office Boy',
                    onTap: () {
                      Get.to(() => const JobDetailView());
                    },
                  ),
                  JobPostCard(
                    jobTitle: 'Project Manager',
                    onTap: () {
                      Get.to(() => const JobDetailView());
                    },
                  ),
                  const MyFooter()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
