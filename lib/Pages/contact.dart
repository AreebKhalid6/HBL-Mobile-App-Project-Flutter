import 'package:canteen_hub/Utils/side_menu.dart';
import 'package:canteen_hub/components/my_header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
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
                    'assets/images/contact-banner.png',
                    fit: BoxFit.fitHeight,
                    height: 170,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          'Contact Us',
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
                          'ENRICH YOUR PROFESSIONAL\nJOURNEY WITH HBL',
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
                    fontSize: 15,
                    color: Colors.black45,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.mail_outline_rounded,
                          color: Color(0xff009984),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'contact@hblasset.com',
                          style: GoogleFonts.raleway(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () async {
                        String? encodeQueryParameters(
                            Map<String, String> params) {
                          return params.entries
                              .map((MapEntry<String, String> e) =>
                                  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                              .join('&');
                        }

                        final Uri emailUri = Uri(
                          scheme: 'mailto',
                          path: 'contact@hblasset.com',
                          query: encodeQueryParameters(<String, String>{
                            'subject': 'Example Subject & Symbols are allowed!',
                          }),
                        );
                        if (await canLaunchUrl(emailUri)) {
                          launchUrl(emailUri);
                        } else {
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text('Something went wrong'),
                            ),
                          );
                        }
                      },
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xff009984),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Send email',
                            style: GoogleFonts.raleway(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
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
      ),
    );
  }
}
