import 'package:flutter/material.dart';

class MyFooter extends StatelessWidget {
  const MyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      color: const Color(0xff009984),
      alignment: Alignment.topCenter,
      child: const Padding(
        padding: EdgeInsets.only(top: 14),
        child: Text(
          '© Copyright 2023 HBL Asset Management Limited.',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
