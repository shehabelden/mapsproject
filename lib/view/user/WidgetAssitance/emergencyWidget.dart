// ignore_for_file: file_names

import 'package:auto_doctor/view/user/WidgetAssitance/Emergency/CarWinchWidget.dart';
import 'package:auto_doctor/view/user/WidgetAssitance/Emergency/PetrolDeliveryWidget.dart';
import 'package:auto_doctor/view/user/WidgetAssitance/Emergency/TiresWidget.dart';
import 'package:auto_doctor/sharedWidgets/spaces/customSizedBox.dart';
import 'package:auto_doctor/sharedWidgets/widgets/AppImageWidgets.dart';
import 'package:auto_doctor/sharedWidgets/widgets/AppTexts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/strings/images.dart';
import '../mapModelBottomSheet.dart';

emergencyWidget(BuildContext context, MediaQueryData mediaQuery) {
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
              title: "Emergency",
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
                onTap:(){},
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
                            AppImagesPath.ambulanceIcon, 50.w, 50.h),
                        customSizedBox(0.0, 8.0),
                        Center(
                          child: AppTexts().customAppNormalText(
                              title: "Ambulance",
                              size: 12.sp,
                              color: Colors.black),
                        ),
                        AppTexts().customAppNormalText(
                            title: "soon",
                            size: 6.sp,
                            color: Colors.red),
                      ],
                    )),
              ),
              InkWell(
                onTap: (){
                  appModelBottomSheet(context,
                      TiresWidget(context, mediaQuery));
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
                            AppImagesPath.tiresIcon, 50.w, 50.h),
                        customSizedBox(0.0, 8.0),
                        Center(
                          child: AppTexts().customAppNormalText(
                              title: "Tires",
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
                      PetrolDeliveryWidget(context, mediaQuery));
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
                            AppImagesPath.petrolIcon, 50.w, 50.h),
                        customSizedBox(0.0, 8.0),
                        Center(
                          child: AppTexts().customAppNormalText(
                              title: "Betrol Delivery",
                              size: 12.sp,
                              color: Colors.black),
                        ),
                      ],
                    )),),
              InkWell(
                onTap: (){
                  appModelBottomSheet(context,
                      CarWinchWidget(context, mediaQuery));
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
                            AppImagesPath.winchIcon, 50.w, 50.h),
                        customSizedBox(0.0, 8.0),
                        Center(
                          child: AppTexts().customAppNormalText(
                              title: "Car Winch",
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
