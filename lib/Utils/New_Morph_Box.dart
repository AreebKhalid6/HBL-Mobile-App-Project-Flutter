import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NeumorphBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final child;
  double? height;
  NeumorphBox({Key? key, required this.child, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      height: height,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xff009984),
        boxShadow: const [
          //darker shadow on the bottom right
          BoxShadow(
            color: Colors.black54,
            blurRadius: 7,
            offset: Offset(3, 3),
          ),
        ],
      ),
    );
  }
}
