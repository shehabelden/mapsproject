import 'package:auto_doctor/sharedWidgets/widgets/AppImageWidgets.dart';
import 'package:auto_doctor/view/Service%20Provider/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../sharedWidgets/spaces/customSizedBox.dart';
import '../../sharedWidgets/widgets/AppTexts.dart';


class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  List<Map<String,dynamic>> myListMap=[
    {"name" : "Tires","imageUrl": "assets/images/Tires.png"},
    {"name" : "Betrol Delivery","imageUrl": "assets/images/Petrol.png"},
    {"name" : "Car Winch","imageUrl": "assets/images/Winch.png"},
    {"name" : "Mechanics Check","imageUrl": "assets/images/Maintenance.png"},
    {"name" : "Computer Check","imageUrl": "assets/images/Computer.png"},
    {"name" : "Electricity","imageUrl": "assets/images/Electricity.png"},
    {"name" : "Battery Check","imageUrl": "assets/images/Battery.png"},
    {"name" : "Regular Maintenance","imageUrl": "assets/images/Maintenance.png"},
    {"name" : "Car Washing","imageUrl": "assets/images/Washing.png"},
    {"name" : "Ambulance","imageUrl": "assets/images/Ambulance.png"},
  ];
  List<bool> Checkboxbool=[
    false,false,false,false,false,false,false,false,false,false
  ];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customSizedBox(0.0, 20.h),
                Column(
                    children: [
                      AppTexts().customAppText(
                    title: "Welcome", size: 22.sp, color: Color.fromARGB(255, 252, 171, 48),),
                      SizedBox(height: 2,),
                      AppTexts()
                          .customAppNormalText(title: " Choose your service", size: 14.sp),
                      ]
                ),
              customSizedBox(0.0, 10.h),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:myListMap.length,
                  itemBuilder: (context,index){
                    return  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(value: Checkboxbool[index], onChanged: (bool? value) {setState(() {
                              Checkboxbool[index] = value!;
                            });},),
                            SizedBox(width: 20,),
                            Text(myListMap[index]["name"])
                          ],
                        ),
                    AppImages().assetImageWithWidthAndHeight(myListMap[index]["imageUrl"], 25.w, 25.h),
                      ],
                    );
                  }),
              customSizedBox(0.0, 30.h),
              InkWell(
                onTap: (){
                  Navigator.of(context) .pushReplacement(
                      MaterialPageRoute(builder: (v){
                        return HomeScreenProv();
                      })
                  );
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
                          title: "CONFIRM",
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