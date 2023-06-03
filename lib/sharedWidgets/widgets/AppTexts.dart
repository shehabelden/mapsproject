// ignore_for_file: file_names

import 'package:auto_doctor/utils/colors/appColors.dart';
import 'package:auto_doctor/utils/strings/appStrings.dart';
import 'package:flutter/widgets.dart';


class AppTexts {
  customAppText(
      {required String title,
      TextOverflow? textOverflow,
      double? size,
      Color? color}) {
    return Text(
      title,
      style: TextStyle(
          color: color ?? AppColors.textFieldlabelColor,
          fontSize: size ?? 12,
          overflow: textOverflow ?? TextOverflow.visible,
          fontWeight: FontWeight.bold,
          fontFamily: AppStrings.appFontFamily),
    );
  }

  customAppNormalText(
      {required String title,
      TextOverflow? textOverflow,
      double? size,
      Color? color}) {
    return Text(
      title,
      style: TextStyle(
          color: color ?? AppColors.textFieldlabelColor,
          fontSize: size ?? 12,
          overflow: textOverflow ?? TextOverflow.visible,
          //fontWeight: FontWeight.bold,
          fontFamily: AppStrings.appFontFamily),
    );
  }
}
