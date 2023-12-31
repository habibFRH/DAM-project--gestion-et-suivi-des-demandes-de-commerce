// customLogoAuth.dart

// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomLogoAuth extends StatelessWidget {
  final double height;
  final double width;

  const CustomLogoAuth({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Image.asset(
          "images/registrecomLogo.png",
          fit: BoxFit.fitWidth,
          height: height,
          width: width,
        ),
      ),
    );
  }
}
