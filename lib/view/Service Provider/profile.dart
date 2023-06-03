import 'package:auto_doctor/sharedWidgets/spaces/customSizedBox.dart';
import 'package:auto_doctor/sharedWidgets/widgets/AppImageWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/colors/appColors.dart';
import '/sharedWidgets/widgets/AppTexts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController(),
      phoneController = TextEditingController(),
      emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orangeColor,
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
                        hintText: 'E-Mail',
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
