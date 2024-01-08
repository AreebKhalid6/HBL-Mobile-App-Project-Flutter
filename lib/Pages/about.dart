import 'package:canteen_hub/Pages/jobPage.dart';
import 'package:canteen_hub/Utils/side_menu.dart';
import 'package:canteen_hub/components/my_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  final _globalKey = GlobalKey<ScaffoldState>();

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
              MyHeader(globalKey: _globalKey),
              const SizedBox(
                height: 20,
              ),
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Image.asset(
                    'assets/images/about-banner.png',
                    fit: BoxFit.fitHeight,
                    height: 170,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          'About Us',
                          style: GoogleFonts.raleway(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 20),
                        child: Text(
                          'KICK START YOUR CAREER\nWITH HBL PEOPLE',
                          style: GoogleFonts.raleway(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
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
                    height: 1.2,
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
                    height: 1.2,
                    fontSize: 15,
                    color: Colors.black45,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const JobPage(),
                  ),
                ),
                child: Container(
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xff009984),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      'Learn More',
                      style: GoogleFonts.raleway(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
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
      ),
    );
  }
}
