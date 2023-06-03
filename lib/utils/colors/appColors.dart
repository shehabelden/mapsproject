// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AppColors {
  static const Color splashPurple = Colors.deepPurple;
  static const Color differentUserTextColor = Color(0xff8F5FAB);
  static const Color textFieldlabelColor = Color(0xff092C4C);
  static Color socialIconBackgroundColor =
      const Color.fromARGB(221, 71, 186, 239);
  static const Color bottomNavIconsColor = Color(0xff00B3E7);
  static const Color orangeColor = Color(0xffFBA33A);
  static const Color redColor = Color(0xffF8465C);
  static const Color backgroundColorGrey = Color(0xffF7F7F7);
  static const Color reciptColor = Color(0xff80D9F2);
  static const Color whiteColor = Colors.white;
  static const Color greenColor = Color(0xff20683E);
  static const Color lightGreenColor = Color(0xffBAD44E);

  static const LinearGradient authButtonGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xffFF6A44),
      Color(0xffE65560),
    ],
  );

  static const LinearGradient cartButtonGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xffEFA651),
      Color(0xffFFB600),
    ],
  );

  static const LinearGradient bundleOneButtonGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xffFF6A44),
      Color(0xffE65560),
    ],
  );

  static const LinearGradient bundleTwoButtonGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffC8D774),
      Color(0xffEFA651),
    ],
  );

  static const LinearGradient bundleThreeButtonGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xff8863A6),
      Color(0xffDA434C),
    ],
  );

  static const LinearGradient paymentButtonGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xffFFCF57),
      Color(0xffFFB600),
    ],
  );

  static const LinearGradient addToCartButtonGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffEFA651),
      Color(0xffFFB600),
    ],
  );
}
