import 'package:auto_doctor/data/Apis/DataCenter/User/DataCenter.dart';
import 'package:auto_doctor/sharedWidgets/attention/customToast.dart';
import 'package:auto_doctor/view/user/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../sharedWidgets/spaces/customSizedBox.dart';
import '../../sharedWidgets/widgets/AppTexts.dart';

class AddCredit extends StatefulWidget {
  const AddCredit({Key? key}) : super(key: key);

  @override
  State<AddCredit> createState() => _AddCreditState();
}

class _AddCreditState extends State<AddCredit> {
  TextEditingController numberController = TextEditingController();
  TextEditingController expiredController = TextEditingController();
  TextEditingController cvcController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20.0),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                customSizedBox(0.0, 60.h),
                AppTexts().customAppText(
                  title: "Add credit",
                  size: 22.sp,
                  color: Colors.black,
                ),
                AppTexts().customAppNormalText(
                    title: "recharge the wallet balance",
                    size: 12.sp,
                    color: Colors.black),
                customSizedBox(0.0, 10.h),
                TextFormField(
                  controller: numberController,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'visa number',
                    border: OutlineInputBorder(),
                  ),
                ),
                customSizedBox(0.0, 10.h),
                TextFormField(
                  controller: expiredController,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    labelText: 'expired date',
                    border: OutlineInputBorder(),
                  ),
                ),
                customSizedBox(0.0, 10.h),
                TextFormField(
                  controller: cvcController,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'cvc',
                    border: OutlineInputBorder(),
                  ),
                ),
                customSizedBox(0.0, 10.h),
                TextFormField(
                  controller: amountController,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'amount',
                    border: OutlineInputBorder(),
                  ),
                ),
                customSizedBox(0.0, 10.h),
                InkWell(
                  onTap: () async {
                    var data = await addPayment(
                        num: numberController.text,
                        date: expiredController.text,
                        cvc: cvcController.text,
                        cunt: amountController.text);
                    if(data.stat == "ok"){
                      showSuccessToast("success");
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (v){
                            return HomeScreen();
                          })
                      );
                    }else{
                      showSuccessToast("Error");
                    }
                  },
                  child: Container(
                    height: 40,
                    margin: EdgeInsets.symmetric(
                      horizontal: 0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xfffab305),
                    ),
                    child: Center(
                      child: AppTexts().customAppText(
                          title: "DONE", size: 15.sp, color: Colors.white),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
