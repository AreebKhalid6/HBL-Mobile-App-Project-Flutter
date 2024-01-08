import 'package:canteen_hub/components/my_header.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:canteen_hub/Pages/job_details.dart';
import 'package:canteen_hub/Utils/job_post_card.dart';
import 'package:canteen_hub/Utils/side_menu.dart';
import 'package:canteen_hub/components/my_footer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobPage extends StatefulWidget {
  const JobPage({Key? key}) : super(key: key);

  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  final _globalKey = GlobalKey<ScaffoldState>();

  // future to fetch user details
  Future<QuerySnapshot<Map<String, dynamic>>> getJobsDetails() async {
    return await FirebaseFirestore.instance.collection('Jobs').get();
  }

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
            MyHeader(globalKey: _globalKey),
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 70,
                    color: const Color(0xff10856B),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  Container(
                    height: 115,
                    width: double.infinity,
                    color: Colors.white,
                    child: CarouselSlider(
                      unlimitedMode: true,
                      enableAutoSlider: true,
                      autoSliderTransitionTime: const Duration(seconds: 3),
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
                        Image.asset(
                          'assets/images/sliderImage1.png',
                          fit: BoxFit.fitWidth,
                        ),
                        Image.asset(
                          'assets/images/sliderImage2.png',
                          fit: BoxFit.fitWidth,
                        ),
                        Image.asset(
                          'assets/images/sliderImage3.png',
                          fit: BoxFit.fitWidth,
                        ),
                        Image.asset(
                          'assets/images/sliderImage4.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ],
                    ),
                  ),
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
                  const SizedBox(
                    height: 20.0,
                  ),
                  FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      future: getJobsDetails(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Text("Error ${snapshot.error}");
                        } else if (snapshot.hasData) {
                          List<QueryDocumentSnapshot<Map<String, dynamic>>>
                              jobs = snapshot.data!.docs;
                          return ListView.builder(
                              itemCount: jobs.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return JobPostCard(
                                  jobTitle: jobs[index]['title'],
                                  jobDescription: jobs[index]['description'],
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => JobDetailView(
                                          jobTitle: jobs[index]['title'],
                                          jobDescription: jobs[index]
                                              ['description'],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              });
                        } else {
                          return const Text('No Data');
                        }
                      }),
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
