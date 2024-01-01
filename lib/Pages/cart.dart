import 'package:canteen_hub/Pages/canteen_view.dart';
import 'package:canteen_hub/Utils/waiting_screens/screen_1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Utils/New_Morph_Box.dart';
import '../Utils/past_order_list.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => const CanteenView());
                    },
                    child: NeumorphBox(
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 20),
              child: Row(
                children: [
                  Text(
                    'My Cart',
                    style: GoogleFonts.raleway(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20, left: 20, top: 5),
              child: Divider(
                color: Color(0xff009984),
                thickness: 0.7,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  PastOrderList(
                    image: 'tea',
                    title: 'Tea',
                    price: '60',
                    quantity: '1',
                  ),
                  PastOrderList(
                    image: 'greentea',
                    title: 'Green Tea',
                    price: '60',
                    quantity: '1',
                  ),
                  PastOrderList(
                    image: 'tea',
                    title: 'Tea',
                    price: '60',
                    quantity: '1',
                  ),
                  PastOrderList(
                    image: 'greentea',
                    title: 'Green Tea',
                    price: '60',
                    quantity: '1',
                  ),
                  PastOrderList(
                    image: 'tea',
                    title: 'Tea',
                    price: '60',
                    quantity: '1',
                  ),
                  PastOrderList(
                    image: 'greentea',
                    title: 'Green Tea',
                    price: '60',
                    quantity: '1',
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: Divider(
                color: Color(0xff009984),
                thickness: 0.7,
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
            InkWell(
              onTap: () {
                Get.to(() => const Screen1());
              },
              child: Container(
                height: 70,
                color: const Color(0xff009984),
                child: Center(
                  child: Text(
                    'Place Order',
                    style: GoogleFonts.raleway(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
