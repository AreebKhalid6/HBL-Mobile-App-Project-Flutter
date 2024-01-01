import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class PastOrderList extends StatefulWidget {
  String image, title, price, quantity;
  PastOrderList(
      {Key? key,
      required this.image,
      required this.price,
      required this.quantity,
      required this.title})
      : super(key: key);

  @override
  State<PastOrderList> createState() => PastOrderListState();
}

class PastOrderListState extends State<PastOrderList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff009984),
              Color(0xff03D7BA),
            ],
          ),
          boxShadow: const [
            BoxShadow(
                color: Colors.black38, offset: Offset(0, 4), blurRadius: 10)
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                'assets/images/${widget.image}.png',
                height: 60,
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.raleway(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Rs ${widget.price}',
                    style: GoogleFonts.raleway(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'x${widget.quantity}',
                      style: GoogleFonts.raleway(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '24/9/2022',
                      style: GoogleFonts.raleway(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
