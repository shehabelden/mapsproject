import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../sharedWidgets/spaces/customSizedBox.dart';
import '../../sharedWidgets/widgets/AppTexts.dart';
import '../../sharedWidgets/widgets/customButton.dart';
import '../../utils/colors/appColors.dart';



class PaymentMethode extends StatefulWidget {
  const PaymentMethode({super.key});

  @override
  State<PaymentMethode> createState() => _PaymentMethodeState();
}

class _PaymentMethodeState extends State<PaymentMethode> {
  bool visaCardCheckBox = false;
  bool payWhenRecieving = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customSizedBox(0.0, 35.h),
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
            customSizedBox(0.0, 35.h),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: AppTexts().customAppText(
                  title: "Payment Method", size: 20.sp, color: Colors.black),
            ),
            const Divider(),
            customSizedBox(0.0, 10.h),
            AppTexts().customAppText(
                title: "Total", size: 18.sp, color: Colors.black),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[300]),
              child: AppTexts().customAppNormalText(
                  title: "     6750 L.E", size: 18.sp, color: Colors.black),
            ),
            customSizedBox(0.0, 15.h),
            AppTexts().customAppText(
                title: "Choose payment method",
                size: 18.sp,
                color: Colors.black),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[300]),
              child: CheckboxListTile(
                title: AppTexts()
                    .customAppNormalText(title: 'Pay With Visa', size: 18.sp),
                autofocus: false,
                activeColor: Colors.green,
                checkColor: Colors.white,
                value: visaCardCheckBox,
                onChanged: (value) {
                  setState(() {
                    visaCardCheckBox = value!;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[300]),
              child: CheckboxListTile(
                title: AppTexts().customAppNormalText(
                    title: 'Paiement when reciving', size: 18.sp),
                autofocus: false,
                activeColor: Colors.green,
                checkColor: Colors.white,
                value: payWhenRecieving,
                onChanged: (value) {
                  setState(() {
                    payWhenRecieving = value!;
                  });
                },
              ),
            ),
            customSizedBox(0.0, 100.h),
            const CustomButton(
                widht: double.infinity,
                color: AppColors.addToCartButtonGradient,
                title: "CHECK OUT")
          ],
        ),
      )),
    );
  }
}
