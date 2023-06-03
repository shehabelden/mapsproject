// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors/appColors.dart';


class CustomTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final TextInputType keyboardType;

  bool isPassword;
  CustomTextField({
    Key? key,
    required this.textEditingController,
    required this.keyboardType,
    required this.isPassword,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        controller: widget.textEditingController,
        keyboardType: widget.keyboardType,
        obscureText: widget.isPassword ? true : false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15.h),
          fillColor: AppColors.backgroundColorGrey,
          filled: true,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
