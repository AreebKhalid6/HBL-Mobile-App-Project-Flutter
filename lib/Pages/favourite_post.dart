import 'package:canteen_hub/Utils/New_Morph_Box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Utils/job_post_card.dart';
import 'jobPage.dart';
import 'job_details.dart';

class FavouritePost extends StatefulWidget {
  const FavouritePost({Key? key}) : super(key: key);

  @override
  State<FavouritePost> createState() => _FavouritePost();
}

class _FavouritePost extends State<FavouritePost> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      // Get.to(() => const HomePage());
                    },
                    child: NeumorphBox(
                      child: const Icon(
                        Icons.arrow_back,
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
                  CircleAvatar(
                    radius: 27.0,
                    backgroundColor: const Color(0xff009984),
                    child: Center(
                      child: Image.asset(
                        'assets/images/avatar.png',
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
                  JobPostCard(
                    jobTitle: 'Accountant',
                    jobDescription:
                        'Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum has been the industry Lorem Ipsum has been the industry.Lorem Ipsum has been the industry Lorem Ipsum has been the industry',
                    onTap: () {
                      // Get.to(() => const JobDetailView());
                    },
                  ),
                  // JobPostCard(
                  //   jobTitle: 'It Manager',
                  //   onTap: () {
                  //     Get.to(() => const JobDetailView());
                  //   },
                  // ),
                  // JobPostCard(
                  //   jobTitle: 'Office Boy',
                  //   onTap: () {
                  //     Get.to(() => const JobDetailView());
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
