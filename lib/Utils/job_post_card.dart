import 'package:canteen_hub/Pages/upload_resume.dart';
import 'package:canteen_hub/Utils/apply_now_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
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
              child: Text(
                widget.jobTitle,
                style: GoogleFonts.raleway(
                  color: const Color(0xff009984),
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                widget.jobDescription,
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
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const UploadResume(),
                      ),
                    );
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
