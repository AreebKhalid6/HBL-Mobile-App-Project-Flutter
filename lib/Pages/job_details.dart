import 'package:canteen_hub/Pages/jobPage.dart';
import 'package:canteen_hub/Pages/upload_resume.dart';
import 'package:canteen_hub/Utils/apply_now_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../Utils/New_Morph_Box.dart';

class JobDetailView extends StatefulWidget {
  const JobDetailView({Key? key}) : super(key: key);

  @override
  State<JobDetailView> createState() => _JobDetailViewState();
}

class _JobDetailViewState extends State<JobDetailView> {
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
                      Navigator.pop(context);
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
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            'IT Manager',
                            style: GoogleFonts.raleway(
                              color: const Color(0xff0A9984),
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
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
                              Icons.star_border,
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
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 1.5,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Stack(
                          children: [
                            Opacity(
                              opacity: 0.3,
                              child: Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: const Color(0xff0A9984),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            Center(
                              child: Image.asset(
                                'assets/images/manager.png',
                                height: 200,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.fade,
                          style: GoogleFonts.raleway(
                            color: const Color(0xff7C7C7C),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: InkWell(
                                onTap: () {
                                  // Get.to(() => const UploadResume());
                                },
                                child: const ApplyNowBtn(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
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
