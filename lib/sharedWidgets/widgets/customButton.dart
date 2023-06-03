// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors/appColors.dart';
import 'AppTexts.dart';

class CustomButton extends StatelessWidget {
  final double widht;
  final LinearGradient color;
  final String title;
  final double? height;
  final VoidCallback? onpress;
  const CustomButton({
    Key? key,
    required this.widht,
    required this.color,
    required this.title,
    this.height,
    this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress ?? () {},
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        width: widht,
        height: height ?? 50,
        decoration: BoxDecoration(
            gradient: color, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: AppTexts().customAppNormalText(
                title: title, size: 20.sp, color: AppColors.whiteColor)),
      ),
    );
  }
}
