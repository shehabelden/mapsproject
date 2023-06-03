import 'package:auto_doctor/view/user/WidgetAssitance/Maintenance/BatteryCheck.dart';
import 'package:auto_doctor/view/user/WidgetAssitance/Maintenance/ComputerCheck.dart';
import 'package:auto_doctor/view/user/WidgetAssitance/Maintenance/Electricity.dart';
import 'package:auto_doctor/view/user/WidgetAssitance/Maintenance/MachanicsCheck.dart';
import 'package:auto_doctor/view/user/mapModelBottomSheet.dart';
import 'package:auto_doctor/sharedWidgets/spaces/customSizedBox.dart';
import 'package:auto_doctor/sharedWidgets/widgets/AppImageWidgets.dart';
import 'package:auto_doctor/sharedWidgets/widgets/AppTexts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/strings/images.dart';

MaintenanceWidget(BuildContext context, MediaQueryData mediaQuery) {
  return Container(
    height: 300.h,
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        color: Colors.white),
    child: Column(
      children: [
        customSizedBox(0.0, 30.h),
        Center(
          child: AppTexts().customAppText(
              title: "Maintenance",
              size: 22.sp,
              color: Colors.black),
        ),
        customSizedBox(0.0, 15.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap:(){
                  appModelBottomSheet(context,
                      MachanicsCheck(context, mediaQuery));
                },
                child:Container(
                    width: 140.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(30.0)),
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        AppImages().assetImageWithWidthAndHeight(
                            AppImagesPath.maintenanceIcon, 50.w, 50.h),
                        customSizedBox(0.0, 8.0),
                        Center(
                          child: AppTexts().customAppNormalText(
                              title: "Mechanics Check",
                              size: 12.sp,
                              color: Colors.black),
                        ),
                      ],
                    )),
              ),
              InkWell(
                onTap: (){
                  appModelBottomSheet(context,
                      ComputerCheck(context, mediaQuery));
                },
                child: Container(
                    width: 140.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(30.0)),
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        AppImages().assetImageWithWidthAndHeight(
                            AppImagesPath.ComputerIcone, 50.w, 50.h),
                        customSizedBox(0.0, 8.0),
                        Center(
                          child: AppTexts().customAppNormalText(
                              title: "Computer Check",
                              size: 12.sp,
                              color: Colors.black),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
        customSizedBox(0.0, 15.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: (){
                  appModelBottomSheet(context,
                      Electricity(context, mediaQuery));
                },
                child: Container(
                    width: 140.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(30.0)),
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        AppImages().assetImageWithWidthAndHeight(
                            AppImagesPath.ElectricityIcone, 50.w, 50.h),
                        customSizedBox(0.0, 8.0),
                        Center(
                          child: AppTexts().customAppNormalText(
                              title: "Electricity",
                              size: 12.sp,
                              color: Colors.black),
                        ),
                      ],
                    )),
              ),
              InkWell(
                onTap: (){
                  appModelBottomSheet(context,
                      BatteryCheck(context, mediaQuery));
                },
                child: Container(
                    width: 140.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(30.0)),
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        AppImages().assetImageWithWidthAndHeight(
                            AppImagesPath.bettaryCheck, 50.w, 50.h),
                        customSizedBox(0.0, 8.0),
                        Center(
                          child: AppTexts().customAppNormalText(
                              title: "Battery Check",
                              size: 12.sp,
                              color: Colors.black),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}