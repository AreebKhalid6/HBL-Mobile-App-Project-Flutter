import 'package:canteen_hub/Pages/profile.dart';
import 'package:canteen_hub/Utils/New_Morph_Box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MyHeader extends StatefulWidget {
  GlobalKey<ScaffoldState> globalKey;
  MyHeader({super.key, required this.globalKey});

  @override
  State<MyHeader> createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              widget.globalKey.currentState?.openDrawer();
            },
            child: NeumorphBox(
              child: const Icon(
                Icons.menu,
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
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
            child: CircleAvatar(
              radius: 27.0,
              backgroundColor: const Color(0xff009984),
              child: Center(
                child: Image.asset(
                  'assets/images/avatar.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
