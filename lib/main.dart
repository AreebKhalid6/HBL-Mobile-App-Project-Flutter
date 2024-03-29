import 'package:canteen_hub/Config/theme_color.dart';
import 'package:canteen_hub/Pages/auth_page.dart';
import 'package:canteen_hub/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primarySwatch: ThemeColor.selectedColor),
      debugShowCheckedModeBanner: false,
      home: const Auth(),
    );
  }
}
