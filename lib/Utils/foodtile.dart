import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff00947F),
                Color(0xff2CDBC3),
              ],
            ),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset('assets/images/tea.png'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Tea',
                    style: GoogleFonts.raleway(
                        letterSpacing: 2,
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'A cup of tea',
                    style: GoogleFonts.raleway(
                        letterSpacing: 2,
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star_border,
                        size: 18,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                  Text(
                    'Rs. 60',
                    style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            // const SizedBox(
            //   width: 10,
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 20),
            //   child: Container(
            //     height: 20,
            //     width: 60,
            //     decoration: const BoxDecoration(
            //         color: Colors.yellow,
            //         borderRadius: BorderRadius.only(
            //           bottomLeft: Radius.circular(5),
            //           topLeft: Radius.circular(5),
            //         )),
            //     child: const Center(
            //         child: Text(
            //       '10% OFF',
            //       style: TextStyle(fontWeight: FontWeight.w600),
            //     )),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
