import 'package:canteen_hub/Pages/upload_resume.dart';
import 'package:canteen_hub/Utils/apply_now_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class JobPostCard extends StatefulWidget {
  String jobTitle;
  String jobDescription;
  VoidCallback onTap;
  JobPostCard({
    super.key,
    required this.jobTitle,
    required this.jobDescription,
    required this.onTap,
  });

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
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                widget.jobDescription,
                // 'Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum has been the industry Lorem Ipsum has been the industry.Lorem Ipsum has been the industry Lorem Ipsum has been the industry',
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
      ),
    );
  }
}
