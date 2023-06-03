import 'package:auto_doctor/sharedWidgets/spaces/customSizedBox.dart';
import 'package:auto_doctor/sharedWidgets/widgets/AppImageWidgets.dart';
import 'package:auto_doctor/utils/colors/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/colors/appColors.dart';
import '../../utils/colors/appColors.dart';
import '/sharedWidgets/widgets/AppTexts.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({super.key});

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  TextEditingController nameController = TextEditingController(),
      phoneController = TextEditingController(),
      emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 171, 48),
      body: SingleChildScrollView(
        child: Column(
          children: [
            customSizedBox(0.0, 130.h),
            Center(
              child: AppTexts().customAppText(
                  title: "Profile", size: 20.sp, color: AppColors.whiteColor),
            ),
            customSizedBox(0.0, 15.h),
            Container(
              height: 535.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customSizedBox(0.0, 20.h),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: AppImages().assetImageWithWidthAndHeight(
                          "assets/images/avatar.png", 90.w, 80.h),
                    ),
                  ),
                  customSizedBox(0.0, 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: AppTexts().customAppText(
                        title: "Edit Profile",
                        size: 18.sp,
                        color: Colors.black),
                  ),
                  customSizedBox(0.0, 15.h),
                  Center(
                    child: AppTexts().customAppNormalText(
                        title: "Account Information",
                        size: 18.sp,
                        color: Colors.grey),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const TextField(
                      decoration: InputDecoration(hintText: 'Name'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const TextField(
                      decoration: InputDecoration(hintText: 'Phone Number'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Pasword',
                      ),
                    ),
                  ),
                  customSizedBox(0.0, 30.h),

                  Container(
                      width: double.infinity,
                      height: 33.h,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 252, 171, 48),
                          borderRadius: BorderRadius.circular(30.0)),
                      margin: EdgeInsets.symmetric(horizontal: 90.w),
                      child: Center(
                        child: AppTexts().customAppText(
                            title: "SAVE",
                            size: 17.sp,
                            color: Colors.white),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
