import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplyNowBtn extends StatelessWidget {
  const ApplyNowBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
        color: const Color(0xff009984),
        borderRadius: BorderRadius.circular(80),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(3, 3),
            blurRadius: 8,
          ),
        ],
      ),
      child: Center(
        child: Text(
          'Apply Now',
          style: GoogleFonts.raleway(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
