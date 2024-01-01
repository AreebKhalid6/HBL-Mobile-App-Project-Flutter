import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NeumorphBox extends StatelessWidget {
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
