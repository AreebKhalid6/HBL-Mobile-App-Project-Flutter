import 'package:canteen_hub/Pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Utils/New_Morph_Box.dart';
import 'job_details.dart';

class SubmitSuccess extends StatelessWidget {
  const SubmitSuccess({Key? key}) : super(key: key);

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
                      Get.to(() => const HomePage());
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
                    height: 40.0,
                  ),
                  Image.asset(
                    'assets/images/success.png',
                    height: 120,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    'Your request has been submited',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'wait for the responce',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xff7c7c7c),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => const HomePage());
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xff009984),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black38,
                                offset: Offset(0, 4),
                                blurRadius: 10),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Explore More Jobs',
                            style: GoogleFonts.raleway(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
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
