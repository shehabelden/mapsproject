// ignore_for_file: Select The Type Of Assitance

import 'package:auto_doctor/view/user/WidgetAssitance/MaintenanceWidget.dart';
import 'package:auto_doctor/view/user/NearbyCenteres.dart';
import 'package:auto_doctor/view/user/WidgetAssitance/anotherWidget.dart';
import 'package:auto_doctor/view/user/WidgetAssitance/emergencyWidget.dart';
import 'package:auto_doctor/view/user/mapModelBottomSheet.dart';
import 'package:auto_doctor/sharedWidgets/spaces/customSizedBox.dart';
import 'package:auto_doctor/sharedWidgets/widgets/AppImageWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/strings/images.dart';
import '/sharedWidgets/widgets/AppTexts.dart';

selectServiceWidget(BuildContext context, MediaQueryData mediaQuery) {
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
              title: "Select The Type Of Assitance",
              size: 18.sp,
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
                  Navigator.of(context) .push(
                      MaterialPageRoute(builder: (v){
                        return NearbyCenteres();
                      })
                  );
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
                            AppImagesPath.NearbyIcone, 50.w, 50.h),
                        customSizedBox(0.0, 8.0),
                        Center(
                          child: AppTexts().customAppNormalText(
                              title: "Nearby centeres",
                              size: 12.sp,
                              color: Colors.black),
                        ),
                      ],
                    )),
              ),
              InkWell(
                onTap: (){
                  appModelBottomSheet(context,
                      emergencyWidget(context, mediaQuery));
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
                            AppImagesPath.EmergencyIcone, 50.w, 50.h),
                        customSizedBox(0.0, 8.0),
                        Center(
                          child: AppTexts().customAppNormalText(
                              title: "Emergency",
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
                      MaintenanceWidget(context, mediaQuery));
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
                            AppImagesPath.maintenanceIcon, 50.w, 50.h),
                        customSizedBox(0.0, 8.0),
                        Center(
                          child: AppTexts().customAppNormalText(
                              title: "Maintenance",
                              size: 12.sp,
                              color: Colors.black),
                        ),
                      ],
                    )),
              ),
              InkWell(
                onTap: (){
                  appModelBottomSheet(context,
                      AnotherWidget(context, mediaQuery));
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
                            AppImagesPath.AnotherIcone, 50.w, 50.h),
                        customSizedBox(0.0, 8.0),
                        Center(
                          child: AppTexts().customAppNormalText(
                              title: "Another",
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
