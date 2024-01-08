import 'dart:io';
import 'package:canteen_hub/Pages/jobPage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Utils/New_Morph_Box.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UploadResume extends StatefulWidget {
  const UploadResume({super.key});

  @override
  State<UploadResume> createState() => _UploadResumeState();
}

class _UploadResumeState extends State<UploadResume> {
  File? file;
  String filename = '';

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
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
                  CircleAvatar(
                    radius: 27.0,
                    backgroundColor: const Color(0xff009984),
                    child: Center(
                      child: Image.asset(
                        'assets/images/avatar.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      Image.asset('assets/images/logo.png'),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Image.asset('assets/images/resumevector.png'),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Time to upload a CV',
                        style: GoogleFonts.raleway(
                          fontSize: 24,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Upload your CV or Resume\nto apply the job vacancy in\nour application',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.raleway(
                            fontSize: 15,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff7C7C7C)),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      GestureDetector(
                        onTap: () async {
                          final result = await FilePicker.platform.pickFiles();
                          if (result == null) return;

                          final _file = result.files.first;
                          final File selecteFile = File(_file.path!);
                          setState(() {
                            file = selecteFile;
                            filename = _file.name;
                          });
                        },
                        child: Container(
                          height: file != null ? 80 : 130,
                          width: file != null ? 240 : 200,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xffEBEBEB),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xff7C7C7C),
                              style: BorderStyle.solid,
                              width: 2,
                            ),
                          ),
                          child: file != null
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.file_upload,
                                      color: Color(0xff7C7C7C),
                                      size: 30,
                                    ),
                                    Text(
                                      filename,
                                      textAlign: TextAlign.justify,
                                    ),
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.document_scanner_outlined,
                                      color: Color(0xff009984),
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      'TAP HERE TO\nATTACH A FILE',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.raleway(
                                        fontSize: 12,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff7C7C7C),
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        child: InkWell(
                          onTap: () async {
                            // Get.to(() => const SubmitSuccess());
                            if (file != null) {
                              showDialog(
                                context: context,
                                builder: (context) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                              firebase_storage.Reference ref =
                                  storage.ref(filename);
                              firebase_storage.UploadTask uploadTask =
                                  ref.putFile(file!.absolute);

                              await Future.value(uploadTask).whenComplete(() {
                                Navigator.pop(context);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    content: Text(
                                        "Your resume uploaded successfully"),
                                  ),
                                );

                                Navigator.pushReplacement(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => const JobPage(),
                                  ),
                                );
                              });
                            } else {
                              print('No file selected');
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xff009984),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black38,
                                    offset: Offset(0, 4),
                                    blurRadius: 10),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'Submit',
                                style: GoogleFonts.raleway(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
