import 'package:canteen_hub/Pages/upload_resume.dart';
import 'package:canteen_hub/Utils/apply_now_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class JobPostCard extends StatefulWidget {
  String jobTitle;
  VoidCallback onTap;
  JobPostCard({super.key, required this.jobTitle, required this.onTap});

  @override
  State<JobPostCard> createState() => _JobPostCardState();
}

class _JobPostCardState extends State<JobPostCard> {
  bool fav = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New Post',
                style: GoogleFonts.raleway(
                  color: const Color(0xff009984),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.jobTitle,
                      style: GoogleFonts.raleway(
                        color: const Color(0xff009984),
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          fav = !fav;
                        });
                      },
                      icon: fav
                          ? const Icon(
                              Icons.favorite_rounded,
                              color: Color(0xffF9595F),
                            )
                          : const Icon(
                              Icons.favorite_outline_rounded,
                              color: Color(0xff7c7c7c),
                            ),
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum has been the industry Lorem Ipsum has been the industry.Lorem Ipsum has been the industry Lorem Ipsum has been the industry',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.raleway(
                    color: const Color(0xff7C7C7C),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Row(
                  //   children: const [
                  //     Icon(
                  //       Icons.thumb_up_off_alt_outlined,
                  //       color: Color(0xff009984),
                  //       size: 26,
                  //     ),
                  //     SizedBox(
                  //       width: 15.0,
                  //     ),
                  //     Icon(
                  //       Icons.messenger_outline_rounded,
                  //       color: Color(0xff009984),
                  //       size: 26,
                  //     ),
                  //     SizedBox(
                  //       width: 15.0,
                  //     ),
                  //     Icon(
                  //       Icons.star_border_rounded,
                  //       color: Color(0xff009984),
                  //       size: 26,
                  //     ),
                  //   ],
                  // ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const UploadResume());
                    },
                    child: const ApplyNowBtn(),
                  )
                ],
              ),
              const Opacity(
                opacity: 0.3,
                child: Divider(
                  color: Color(0xff009984),
                  thickness: 1,
                  height: 30,
                ),
              ),
            ],
          ),
        )

        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        //   child: Container(
        //     width: double.infinity,
        //     decoration: BoxDecoration(
        //         color: Colors.white,
        //         border: Border.all(
        //           color: const Color(0xff009984),
        //           width: 5,
        //         ),
        //         borderRadius: BorderRadius.circular(20),
        //         boxShadow: [
        //           BoxShadow(
        //             color: Colors.grey.shade500,
        //             blurRadius: 5,
        //             spreadRadius: 2,
        //             offset: const Offset(0, 0),
        //           )
        //         ]),
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(
        //             'New Post',
        //             style: GoogleFonts.raleway(
        //               color: const Color(0xff0A9984),
        //               fontWeight: FontWeight.w400,
        //             ),
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.only(top: 20),
        //             child: Text(
        //               widget.jobTitle,
        //               style: GoogleFonts.raleway(
        //                 color: const Color(0xff0A9984),
        //                 fontWeight: FontWeight.w700,
        //                 fontSize: 24,
        //               ),
        //             ),
        //           ),
        //           Row(
        //             children: const [
        //               Icon(
        //                 Icons.star,
        //                 size: 25,
        //                 color: Colors.yellow,
        //               ),
        //               Icon(
        //                 Icons.star,
        //                 size: 25,
        //                 color: Colors.yellow,
        //               ),
        //               Icon(
        //                 Icons.star,
        //                 size: 25,
        //                 color: Colors.yellow,
        //               ),
        //               Icon(
        //                 Icons.star_border,
        //                 size: 25,
        //                 color: Colors.yellow,
        //               ),
        //               Icon(
        //                 Icons.star_border,
        //                 size: 25,
        //                 color: Colors.yellow,
        //               ),
        //             ],
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.symmetric(vertical: 15),
        //             child: Text(
        //               'Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum has been the industry Lorem Ipsum has been the industry',
        //               maxLines: 3,
        //               overflow: TextOverflow.ellipsis,
        //               style: GoogleFonts.raleway(
        //                 color: const Color(0xff7C7C7C),
        //               ),
        //             ),
        //           ),
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.end,
        //             children: [
        //               // Row(
        //               //   children: const [
        //               //     Icon(
        //               //       Icons.thumb_up_off_alt_outlined,
        //               //       color: Color(0xff009984),
        //               //       size: 26,
        //               //     ),
        //               //     SizedBox(
        //               //       width: 15.0,
        //               //     ),
        //               //     Icon(
        //               //       Icons.messenger_outline_rounded,
        //               //       color: Color(0xff009984),
        //               //       size: 26,
        //               //     ),
        //               //     SizedBox(
        //               //       width: 15.0,
        //               //     ),
        //               //     Icon(
        //               //       Icons.star_border_rounded,
        //               //       color: Color(0xff009984),
        //               //       size: 26,
        //               //     ),
        //               //   ],
        //               // ),
        //               InkWell(
        //                 onTap: () {
        //                   Get.to(const UploadResume());
        //                 },
        //                 child: const ApplyNowBtn(),
        //               )
        //             ],
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        );
  }
}
