import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryBox extends StatefulWidget {
  String name;
  String image;
  VoidCallback onTap;
  CategoryBox(
      {Key? key, required this.name, required this.image, required this.onTap})
      : super(key: key);

  @override
  State<CategoryBox> createState() => _CategoryBoxState();
}

class _CategoryBoxState extends State<CategoryBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Container(
          margin: const EdgeInsets.only(top: 20.0),
          height: 150.0,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              //darker shadow on the bottom right
              BoxShadow(
                color: Colors.black54,
                blurRadius: 7,
                offset: Offset(3, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/${widget.image}.png',
                  fit: BoxFit.fitWidth,
                ),
                Container(
                  height: 150.0,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [Colors.black, Colors.transparent]),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Positioned(
                  top: 30.0,
                  left: 30.0,
                  child: Text(
                    widget.name,
                    style: GoogleFonts.raleway(
                        letterSpacing: 2,
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
