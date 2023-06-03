import 'package:auto_doctor/data/models/RequestServiceRes.dart';
import 'package:auto_doctor/sharedWidgets/attention/customToast.dart';
import 'package:auto_doctor/view/user/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/colors/appColors.dart';
import '../../data/Apis/DataCenter/User/HistoryService.dart';
import '../../sharedWidgets/spaces/customSizedBox.dart';
import '../../sharedWidgets/widgets/AppTexts.dart';
import '../../sharedWidgets/widgets/customButton.dart';

class ConfirmItem extends StatefulWidget {
  const ConfirmItem({super.key});

  @override
  State<ConfirmItem> createState() => _ConfirmItemState();
}

class _ConfirmItemState extends State<ConfirmItem> {
  int? idReq;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFBA33A),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customSizedBox(0.0, 35.h),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: AppTexts().customAppText(
                  title: "Confirmation", size: 20.sp, color: Colors.black),
            ),
            const Divider(),
            customSizedBox(0.0, 10.h),
            AppTexts().customAppText(
                title: "   Car Details", size: 18.sp, color: Colors.black),
            customSizedBox(0.0, 10.h),
             Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[300]),
                    child: Column(
                      children: [
                        FutureBuilder<RequestServiceRes>(
                          future: getCheckOut()
                          ,builder: (context, snapshot) {
                            var data = snapshot.data?.data;
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: data?.length??0,
                              itemBuilder: (BuildContext context, int index) {
                                  idReq =  data?[index].id;
                                return Column(
                                    children: [
                                      ListTile(
                                          trailing: AppTexts().customAppNormalText(
                                              title:
                                              "${data?[index].prise} L.E",
                                              size: 15.sp,
                                              color: Colors.black),
                                          title: AppTexts().customAppText(
                                              title: data?[index].typeServ??'',
                                              size: 15.sp,
                                              color: Colors.black)),
                                      const Divider()
                                    ],
                                  );
                                }
                              );
                        },),
                      ],
                    ),
                  ),
            customSizedBox(0.0, 100.h),
            CustomButton(
                onpress: () async {
                  String data = await checkOut(idService:idReq.toString()) ;
                  if(data == "Your current balance is not allowed"){
                    showFailedToast("Your current balance is not allowed");
                  }else if(data == "ok") {
                    showSuccessToast("Successes");
                    Navigator.of(context) .push(
                        MaterialPageRoute(builder: (v){
                          return HomeScreen();
                        })
                    );
                  }else {
                    showFailedToast("Error");
                  }

                },
                widht: double.infinity,
                color: AppColors.addToCartButtonGradient,
                title: "CHECK OUT")
          ],
        ),
      )),
    );
  }

}
