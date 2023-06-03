import 'package:auto_doctor/sharedWidgets/widgets/AppTexts.dart';
import 'package:auto_doctor/view/Service%20Provider/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmService extends StatefulWidget {
  const ConfirmService({Key? key}) : super(key: key);

  @override
  State<ConfirmService> createState() => _ConfirmServiceState();
}

class _ConfirmServiceState extends State<ConfirmService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(20.0),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 25,),
                Image(
                  image: AssetImage('assets/images/logoo_2.png'),
                ),
                SizedBox(
                  height: 10,),
                Text("Confirm Phone Number", style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),),
                SizedBox(
                  height: 20,),
                TextFormField(
                  style: TextStyle(fontSize: 12,),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Code',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15,),
                InkWell(
                  onTap: (){
                    Navigator.of(context) .push(
                        MaterialPageRoute(builder: (v){
                          return LoginServic();
                        })
                    );
                  },
                  child: Container(
                    height: 40,
                    margin: EdgeInsets.symmetric(
                      horizontal: 0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 252, 171, 48),
                    ),
                    child: Center(
                      child: AppTexts().customAppText(
                          title: "CONFIRM",
                          size: 15.sp,
                          color: Colors.white),
                    ),
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}
