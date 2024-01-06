import 'package:canteen_hub/Pages/profile.dart';
import 'package:canteen_hub/Utils/New_Morph_Box.dart';
import 'package:canteen_hub/Utils/side_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'About Us',
                  style: GoogleFonts.raleway(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Opacity(
                    opacity: 0.3,
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: const Color(0xff0A9984),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Image.asset(
                    'assets/images/manager.png',
                    height: 200,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'HBL Asset Management Limited (HBL AMC) is a wholly owned subsidiary of HBL, the largest commercial bank in Pakistan. The company was incorporated in February, 2006 as a public limited company under the Companies Ordinance 1984. It was licensed for Investment Advisory and Asset Management Services by the Securities and Exchange Commission of Pakistan in April, 2006.',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.raleway(
                    fontSize: 15,
                    color: Colors.black45,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'The company launched its first fund in 2007 and has developed a track record of strong and consistent growth over the past decade. With a nationwide foot print of retail and corporate clients, HBL AMC is one of the largest private fund management company in the country. During the year 2016, HBL AMC acquired PICIC Asset Management Company Limited which has subsequently merged into HBL AMC.',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.raleway(
                    fontSize: 15,
                    color: Colors.black45,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Center(
              //   child: Text(
              //     'Vision and Mission',
              //     textAlign: TextAlign.justify,
              //     style: GoogleFonts.raleway(
              //       fontSize: 20,
              //       fontWeight: FontWeight.w600,
              //       color: Colors.black45,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
