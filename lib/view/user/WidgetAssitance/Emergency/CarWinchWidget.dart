import 'package:auto_doctor/sharedWidgets/spaces/customSizedBox.dart';
import 'package:auto_doctor/sharedWidgets/widgets/AppImageWidgets.dart';
import 'package:auto_doctor/sharedWidgets/widgets/AppTexts.dart';
import 'package:auto_doctor/view/user/WidgetAssitance/nearestForYou.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/strings/images.dart';

Widget CarWinchWidget(BuildContext context, MediaQueryData mediaQuery) {
  return Container(
    height: 280.h,
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        color: Color.fromARGB(255, 252, 171, 48)),
    child: Column(
      children: [
        customSizedBox(0.0, 40.h),
        Container(
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Center(
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppTexts().customAppNormalText(
                      title: "Car Winch",
                      size: 12.sp,
                      color: Colors.grey),
                  AppTexts()
                      .customAppNormalText(title: "300 - 390 L.E", size: 10.sp),
                ],
              ),
              leading: AppImages().assetImageWithWidthAndHeight(
                  AppImagesPath.winchIcon, 30.w, 30.h),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_upward_outlined,
                    color: Colors.black,
                  )),
            ),
          ),
        ),
        customSizedBox(0.0, 15.h),
        Container(
          width: double.infinity,
          height: 40.h,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
          margin: EdgeInsets.only(left: 100.w, right: 20.w),
          child: ListTile(
            title: AppTexts()
                .customAppNormalText(title: "Emergency Service", size: 14.sp),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_upward_outlined,
                  color: Colors.black,
                )),
          ),
        ),
        customSizedBox(0.0, 15.h),
        InkWell(
          onTap: (){
            Navigator.of(context) .push(
                MaterialPageRoute(builder: (v){
                  return NearestForYou(nearest: "Winch Station",id: 'Car Washing',);
                })
            );
          },
          child: Container(
              width: double.infinity,
              height: 30.h,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30.0)),
              margin: EdgeInsets.symmetric(horizontal: 25.w),
              child: Center(
                child: AppTexts().customAppNormalText(
                    title: "GET AUTO RESCUE", size: 18.sp, color: Colors.white),
              )),
        ),
      ],
    ),
  );
}