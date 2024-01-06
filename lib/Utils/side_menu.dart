// import 'package:canteen_hub/Pages/Login.dart';
import 'package:canteen_hub/Pages/Loginpage.dart';
import 'package:canteen_hub/Pages/about.dart';
import 'package:canteen_hub/Pages/canteen_view.dart';
import 'package:canteen_hub/Pages/favourite_post.dart';
import 'package:canteen_hub/Pages/jobPage.dart';
import 'package:canteen_hub/Pages/my_orders.dart';
import 'package:canteen_hub/Pages/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  // current logged in user
  final User? currentUser = FirebaseAuth.instance.currentUser;

  // future to fetch user details
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff009984),
            Color(0xff02E1C3),
          ],
        ),
      ),
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/HBL_White.png',
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const ProfilePage(),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 35.0,
                          backgroundColor: Colors.white,
                          child: Center(
                            child: Image.asset(
                              'assets/images/avatar.png',
                              // height: 52,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: FutureBuilder<
                                DocumentSnapshot<Map<String, dynamic>>>(
                            future: getUserDetails(),
                            builder: (context, snapshot) {
                              // loading
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.hasError) {
                                return Text("Error ${snapshot.error}");
                              } else if (snapshot.hasData) {
                                // extract data
                                Map<String, dynamic>? user =
                                    snapshot.data!.data();
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user!['fullName'] ?? 'Momin Nadeem',
                                      overflow: TextOverflow.clip,
                                      style: GoogleFonts.raleway(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      '@${user['username']}',
                                      style: GoogleFonts.raleway(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return const Text('No Data');
                              }
                            }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    },
                    child: Text(
                      'Profile',
                      style: GoogleFonts.raleway(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                ),
                const Divider(
                  color: Color(0xff079682),
                  thickness: 1,
                  // height: 1,
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 15),
                //   child: InkWell(
                //     onTap: () {
                //       Get.to(() => const MyOrdersPage());
                //     },
                //     child: Text(
                //       'My Orders',
                //       style: GoogleFonts.raleway(
                //         fontSize: 18,
                //         fontWeight: FontWeight.w500,
                //         color: Colors.white,
                //         letterSpacing: 0.4,
                //       ),
                //     ),
                //   ),
                // ),
                // const Divider(
                //   color: Color(0xff079682),
                //   thickness: 1,
                //   // height: 1,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 15),
                //   child: InkWell(
                //     onTap: () {
                //       Get.to(() => const CanteenView());
                //     },
                //     child: Text(
                //       'View Canteen',
                //       style: GoogleFonts.raleway(
                //         fontSize: 18,
                //         fontWeight: FontWeight.w500,
                //         color: Colors.white,
                //         letterSpacing: 0.4,
                //       ),
                //     ),
                //   ),
                // ),
                // const Divider(
                //   color: Color(0xff079682),
                //   thickness: 1,
                //   // height: 1,
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const JobPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Job Listing',
                      style: GoogleFonts.raleway(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                ),
                const Divider(
                  color: Color(0xff079682),
                  thickness: 1,
                  // height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const About(),
                        ),
                      );
                    },
                    child: Text(
                      'About',
                      style: GoogleFonts.raleway(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                ),
                const Divider(
                  color: Color(0xff079682),
                  thickness: 1,
                  // height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: InkWell(
                    onTap: () {
                      // Get.to(() => const Login());
                    },
                    child: Text(
                      'Contact',
                      style: GoogleFonts.raleway(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: GestureDetector(
                    onTap: () async {
                      // Sign out the user when "Logout" is tapped
                      await FirebaseAuth.instance.signOut();
                    },
                    child: Container(
                      width: 160,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black38,
                                offset: Offset(0, 3),
                                blurRadius: 8)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Center(
                          child: Text(
                            'Logout',
                            style: GoogleFonts.raleway(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff009984),
                            ),
                          ),
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
    );
  }
}
