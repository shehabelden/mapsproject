// ignore_for_file: file_names

import 'package:auto_doctor/view/user/mapModelBottomSheet.dart';
import 'package:auto_doctor/view/user/WidgetAssitance/selectServiceWidget.dart';
import 'package:auto_doctor/sharedWidgets/spaces/customSizedBox.dart';
import 'package:auto_doctor/sharedWidgets/widgets/AppImageWidgets.dart';
import 'package:auto_doctor/sharedWidgets/widgets/AppTexts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/strings/images.dart';

class SelectTheTypeOfWidget extends StatelessWidget {
  const SelectTheTypeOfWidget({
    super.key,
    required this.mediaQuery,
  });

  final MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          vertical: mediaQuery.size.height * 0.7-20,
        ).copyWith(bottom: 0.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 252, 171, 48),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36),
                  ),
                ),
                child: Column(children: <Widget>[
                  customSizedBox(0.0, 30.h),
                  InkWell(
                    onTap: (){
                      appModelBottomSheet(context,
                          selectServiceWidget(context, mediaQuery));
                    },
                    child: Container(
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
                                  title: "SELECT THE TYPE OF", size: 15.sp, color: Colors.grey),
                            ],
                          ),
                          leading: AppImages().assetImageWithWidthAndHeight(
                              AppImagesPath.IconeApp, 30.w, 28.h),
                          trailing: Icon(
                                Icons.arrow_upward_outlined,
                                color: Colors.black,
                              ),
                        ),
                      ),
                    ),
                  ),
                  customSizedBox(0.0, 8.h),
                  Container(
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
                ]),
              ),
            ),
          ],
        ),
      );
  }
}
