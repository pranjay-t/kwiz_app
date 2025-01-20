import 'dart:ui';
import 'package:flutter/material.dart';

class BackgroundBlur extends StatelessWidget {
  const BackgroundBlur({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Image.asset(
          'assets/images/app_bg.jpeg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
