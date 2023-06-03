import 'package:auto_doctor/data/Apis/DataCenter/Service/Requstes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/colors/appColors.dart';
import '../../data/Apis/DataCenter/Service/RequestrsActhion.dart';
import '../../data/models/RequestServiceRes.dart';
import '../../sharedWidgets/attention/customToast.dart';
import '../../sharedWidgets/spaces/customSizedBox.dart';
import '../../sharedWidgets/widgets/AppTexts.dart';
import 'HomeScreen.dart';

class HistoryService extends StatefulWidget {
  const HistoryService({super.key});

  @override
  State<HistoryService> createState() => _HistoryServiceState();
}

class _HistoryServiceState extends State<HistoryService> {
  TextEditingController ditailsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 252, 171, 48) ,
      ),
      backgroundColor: Color.fromARGB(255, 252, 171, 48),
      body: SingleChildScrollView(
        child: Column(
          children: [
            customSizedBox(0.0, 110.h),
            Center(
              child: AppTexts().customAppText(
                  title: "Current Requests", size: 25.sp, color: Colors.white),
            ),
            customSizedBox(0.0, 15.h),
            Container(
              width: double.infinity,
              height: 545.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
              child: FutureBuilder<RequestServiceRes>(
                future: getReqNotCompleatedService(),
                builder: (context, snapshot) {
                  var data = snapshot.data?.data;
                  if (snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  return ListView.builder(
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
                                const Icon(
                                  Icons.home_repair_service_sharp,
                                  color: Colors.cyan,
                                ),
                                AppTexts().customAppNormalText(
                                    title: data?[index].prise.toString()??'',
                                    size: 15.sp,
                                    color: Colors.grey)
                              ],
                            ),
                            AppTexts().customAppNormalText(
                                title:
                                data?[index].typeServ??'',
                                size: 17.sp,
                                textOverflow: TextOverflow.ellipsis),
                            SizedBox(height: 12,),
                            AppTexts().customAppNormalText(
                                title:
                                data?[index].text??'',
                                size: 14.sp,
                                textOverflow: TextOverflow.ellipsis),
                            SizedBox(height: 12,),
                            AppTexts().customAppNormalText(
                                title:
                                data?[index].phone??'',
                                size: 14.sp,
                                textOverflow: TextOverflow.ellipsis),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: ditailsController,
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      labelText: 'Nots',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: ()async{
                                    int respons  = await ReqActhion("complete_req/${data![index].id}/${ditailsController.text}");
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
                                            title: "End Requests",
                                            size: 12.sp,
                                            color: Colors.white),
                                      )),
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
