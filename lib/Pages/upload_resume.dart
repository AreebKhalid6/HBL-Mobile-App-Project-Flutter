import 'package:canteen_hub/Pages/job_details.dart';
import 'package:canteen_hub/Pages/submit_success.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Utils/New_Morph_Box.dart';

class UploadResume extends StatefulWidget {
  const UploadResume({super.key});

  @override
  State<UploadResume> createState() => _UploadResumeState();
}

class _UploadResumeState extends State<UploadResume> {
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
                      Get.to(() => const JobDetailView());
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
                  Column(
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      Image.asset('assets/images/logo.png'),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Image.asset('assets/images/resumevector.png'),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Time to upload a CV',
                        style: GoogleFonts.raleway(
                          fontSize: 24,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Upload your CV or Resume\nto apply the job vacancy in\nour application',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.raleway(
                            fontSize: 15,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff7C7C7C)),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 130,
                        width: 200,
                        decoration: BoxDecoration(
                          color: const Color(0xffEBEBEB),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: const Color(0xff7C7C7C),
                              style: BorderStyle.solid,
                              width: 2),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.document_scanner_outlined,
                              color: Color(0xff009984),
                              size: 30,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'TAP HERE TO\nATTACH A FILE',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.raleway(
                                fontSize: 12,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff7C7C7C),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => const SubmitSuccess());
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
                                'Submit',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
