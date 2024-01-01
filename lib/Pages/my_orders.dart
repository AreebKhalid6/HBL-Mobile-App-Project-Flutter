import 'package:canteen_hub/Pages/profile.dart';
import 'package:canteen_hub/Utils/past_order_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../Utils/New_Morph_Box.dart';
import '../Utils/side_menu.dart';
import 'homePage.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
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
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      _globalKey.currentState?.openDrawer();
                      // Get.to(() => const HomePage());
                    },
                    child: NeumorphBox(
                      child: const Icon(
                        Icons.arrow_back,
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
                      Get.to(() => const ProfilePage());
                    },
                    child: CircleAvatar(
                      radius: 27.0,
                      backgroundColor: const Color(0xff009984),
                      child: Center(
                          child: Image.asset(
                        'assets/images/avatar.png',
                      )),
                    ),
                  )
                ],
              ),
            ),
            Image.asset('assets/images/logo.png'),
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 20),
              child: Row(
                children: [
                  Text(
                    'My Orders',
                    style: GoogleFonts.raleway(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Divider(
                thickness: 2,
              ),
            ),
            const SizedBox(
              height: 20,
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
