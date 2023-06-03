import 'package:auto_doctor/data/Apis/DataCenter/Service/RequestrsActhion.dart';
import 'package:auto_doctor/sharedWidgets/attention/customToast.dart';
import 'package:auto_doctor/view/Service%20Provider/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/RequestServiceRes.dart';
import '../../sharedWidgets/spaces/customSizedBox.dart';
import '../../sharedWidgets/widgets/AppTexts.dart';
import '../../utils/colors/appColors.dart';


class OrderDetails extends StatefulWidget {
  OrderDetails({super.key , required this.data});
  Data data ;

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 252, 171, 48) ,
      ),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customSizedBox(0.0, 20.h),
          Center(
            child: Column(
                children: [
              AppTexts().customAppText(
                title: "Details",
                size: 22.sp,
                color: Color.fromARGB(255, 252, 171, 48),
              ),
            ]),
          ),
          customSizedBox(0.0, 10.h),
          Container(
            width: double.infinity,
            height: 200.h,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10.0)),
            margin: EdgeInsets.symmetric(horizontal: 0.w),
            child: ListView(
              padding: EdgeInsets.all(10.0),
                  children: [
                    AppTexts().customAppText(
                      title: "Order Details :",
                      size: 12.sp,
                      color: Colors.black,
                    ),
                    customSizedBox(0.0, 10.h),
                    AppTexts().customAppNormalText(
                        title: widget.data.text??'', size: 12.sp, color: Colors.black),
                    customSizedBox(0.0, 110.h),
                  ],
                ),
          ),
              customSizedBox(0.0, 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: ()async{
                          int respons  = await ReqActhion("acccept_req/${widget.data.id}");
                          if (respons == 200){
                            showSuccessToast("Success");
                            Navigator.of(context) .push(
                                MaterialPageRoute(builder: (v){
                                  return HomeScreenProv();
                                })
                            );
                          }else{
                            showFailedToast("Failed Accept");
                          }
                      },
                      child: Container(
                          width: 90,
                          height: 33.h,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 252, 171, 48),
                              borderRadius: BorderRadius.circular(12.0)),
                          margin: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Center(
                            child: AppTexts().customAppText(
                                title: "Accept",
                                size: 15.sp,
                                color: Colors.white),
                          )),
                    ),
                    SizedBox(width: 15,),
                    InkWell(
                      onTap: ()async{
                       int respons  = await ReqActhion("delete_req/${widget.data.id}");
                       if (respons == 200){
                         showSuccessToast("Success");
                         Navigator.of(context) .push(
                             MaterialPageRoute(builder: (v){
                               return HomeScreenProv();
                             })
                         );
                       }else{
                         showFailedToast("Failed deleted");
                       }
                      },
                      child: Container(
                          width: 90,
                          height: 33.h,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 252, 171, 48),
                              borderRadius: BorderRadius.circular(12.0)),
                          margin: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Center(
                            child: AppTexts().customAppText(
                                title: "Reject",
                                size: 15.sp,
                                color: Colors.white),
                          )),
                    ),
                  ],
              ),
        ]),
      ),
    );
  }
}
