import 'package:canteen_hub/Pages/canteen_view.dart';
import 'package:canteen_hub/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_line/dotted_line.dart';

class Reciept extends StatefulWidget {
  const Reciept({Key? key}) : super(key: key);

  @override
  State<Reciept> createState() => _RecieptState();
}

class _RecieptState extends State<Reciept> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 50),
              child: Center(
                child: Image.asset(
                  'assets/images/HBL.png',
                  height: 50,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Reciept',
                      style: GoogleFonts.raleway(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: DottedLine(
                  dashColor: Color(0xffD9D9D9),
                  lineThickness: 4,
                  dashRadius: 20,
                  dashGapLength: 10,
                  dashLength: 21,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  orderDetail(),
                  orderDetail(),
                  orderDetail(),
                  orderDetail(),
                  orderDetail(),
                  orderDetail(),
                  orderDetail(),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: DottedLine(
                  dashColor: Color(0xffD9D9D9),
                  lineThickness: 4,
                  dashRadius: 20,
                  dashGapLength: 10,
                  dashLength: 21,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 20, left: 20, top: 15, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Amount',
                    style: GoogleFonts.raleway(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff009984),
                    ),
                  ),
                  Text(
                    'Rs. 110.00',
                    style: GoogleFonts.raleway(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xffAC2A2A),
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            //   child: Container(
            //     height: 60,
            //     decoration: BoxDecoration(
            //       color: const Color(0xff009984),
            //       borderRadius: BorderRadius.circular(5),
            //       boxShadow: const [
            //         BoxShadow(
            //             color: Colors.black45,
            //             offset: Offset(0, 3),
            //             blurRadius: 5),
            //       ],
            //     ),
            //     child: Center(
            //       child: Text(
            //         'Save to gallery',
            //         style: GoogleFonts.raleway(
            //           fontSize: 20,
            //           fontWeight: FontWeight.w600,
            //           color: const Color(0xffffffff),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: InkWell(
                onTap: () {
                  Get.to(() => const CanteenView());
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xff009984),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 3),
                          blurRadius: 5),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Go to Home',
                      style: GoogleFonts.raleway(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget orderDetail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Kurkure Red',
            style: GoogleFonts.raleway(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'x1',
            style: GoogleFonts.raleway(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
