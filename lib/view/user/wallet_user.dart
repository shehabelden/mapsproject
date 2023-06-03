import 'package:auto_doctor/data/Apis/DataCenter/User/HistoryService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/RepotpRes.dart';
import '../../sharedWidgets/spaces/customSizedBox.dart';
import '../../sharedWidgets/widgets/AppTexts.dart';
import '../../utils/colors/appColors.dart';


class WalletUser extends StatelessWidget {
  const WalletUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orangeColor,
      body: Column(
        children: [
          customSizedBox(0.0, 130.h),
          Center(
            child: AppTexts().customAppText(
                title: "Wallet", size: 20.sp, color: AppColors.whiteColor),
          ),
          customSizedBox(0.0, 15.h),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisSize: MainAxisSize.min,
                children: [
                  customSizedBox(0.0, 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: AppTexts().customAppText(
                        title: "My Balance", size: 18.sp, color: Colors.black),
                  ),
                  FutureBuilder<ReportRes>(
                    future: getBalance(),
                    builder: (context, snapshot) {
                      var data = snapshot.data?.stat;
                      print(data);
                    return  Container(
                      margin: EdgeInsets.symmetric(vertical: 10.h),
                      width: double.infinity,
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20.0)),
                      child: AppTexts().customAppNormalText(
                          title: "EGP  $data", size: 15.sp, color: Colors.black),
                    );
                  },),
                  customSizedBox(0.0, 1.0)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
