import 'package:auto_doctor/view/Service%20Provider/order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors/appColors.dart';
import '../../data/Apis/DataCenter/Service/Requstes.dart';
import '../../data/models/RequestServiceRes.dart';
import '../../sharedWidgets/spaces/customSizedBox.dart';
import '../../sharedWidgets/widgets/AppTexts.dart';

class Requests extends StatefulWidget {
  const Requests({super.key});

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 252, 171, 48) ,
      ),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            customSizedBox(0.0, 130.h),
            Center(
              child: AppTexts().customAppText(
                  title: "Requests", size: 25.sp, color: Colors.black),
            ),
            customSizedBox(0.0, 15.h),
            Container(
              width: double.infinity,
              height: 545.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: const BoxDecoration(
                  color: AppColors.orangeColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
              child: FutureBuilder<RequestServiceRes>(
                future: getReqService(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  var data = snapshot.data?.data;

                return data!.isEmpty?  Center(
                  child: AppTexts().customAppText(
                      title: "No Requests", size: 25.sp, color: Colors.black),
                )
                    :ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: data?.length??0,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppTexts().customAppText(
                                          title: data?[index].typeServ??'',
                                          size: 20.sp,
                                          color: AppColors.whiteColor),
                                      Padding(
                                        padding: EdgeInsets.only(left: 50.w),
                                        child: AppTexts().customAppNormalText(
                                            title: data?[index].phone??'',
                                            size: 15.sp,
                                            color: Colors.black),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                          },
                                          icon: const Icon(
                                            Icons.telegram,
                                            color: Colors.white,
                                          ))
                                    ]),
                                InkWell(
                                  onTap: (){
                                    Navigator.of(context) .push(
                                        MaterialPageRoute(builder: (v){
                                          return OrderDetails(data: data![index],);
                                        })
                                    );
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50.0)),
                                    child: const Icon(Icons.arrow_forward),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 1,
                            )
                          ],
                        ),
                      );
                    });
              },)
            )
          ],
        ),
      ),
    );
  }
}
