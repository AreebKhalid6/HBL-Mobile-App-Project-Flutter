import 'package:canteen_hub/Utils/New_Morph_Box.dart';
import 'package:canteen_hub/Utils/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _globalKey,
        drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.65,
          child: const SideMenu(),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      _globalKey.currentState?.openDrawer();
                      // Get.to(() => const Login());
                    },
                    child: NeumorphBox(
                        child: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    )),
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
                      // Get.to(() => const ProfilePage());
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
            ),
          ],
        ),
      ),
    );
  }
}
