import 'package:auto_doctor/data/Apis/DataCenter/User/SendRebort.dart';
import 'package:auto_doctor/data/models/ServiceRes.dart';
import 'package:auto_doctor/sharedWidgets/spaces/customSizedBox.dart';
import 'package:auto_doctor/sharedWidgets/widgets/AppTexts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DescriptionProblem extends StatefulWidget {
  Data? data  ;
    DescriptionProblem({super.key,required this.data});

  @override
  State<DescriptionProblem> createState() => _DescriptionProblemState();
}
TextEditingController problemController = TextEditingController();
class _DescriptionProblemState extends State<DescriptionProblem> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customSizedBox(0.0, 55.h),
                Column(
                    children: [
                      AppTexts().customAppText(
                    title: "Problem", size: 22.sp, color: Color.fromARGB(255, 252, 171, 48),),
                      SizedBox(height: 2,),
                      AppTexts()
                          .customAppNormalText(title: " description of the problem", size: 14.sp),
                      ]
                ),
              customSizedBox(0.0, 15.h),
              TextField(
                maxLines: 8,
                controller: problemController,
                keyboardType: TextInputType.multiline,
                style: TextStyle(fontSize: 12,),
                decoration: InputDecoration(
                  labelText: "what is the problem",
                  border: OutlineInputBorder(),
                ),
                ),
              customSizedBox(0.0, 10.h),
              InkWell(
                onTap: (){

                   Report().sendReport(widget.data!.id.toString(), problemController.text,widget.data!.prise.toString() , context);
                },
                child: Container(
                    width: double.infinity,
                    height: 33.h,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 252, 171, 48),
                        borderRadius: BorderRadius.circular(30.0)),
                    margin: EdgeInsets.symmetric(horizontal: 90.w),
                    child: Center(
                      child: AppTexts().customAppText(
                          title: "SEND",
                          size: 15.sp,
                          color: Colors.white),
                    )),
              )

            ],
        ),
      ),
    );
  }
}