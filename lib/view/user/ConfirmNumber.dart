import 'package:auto_doctor/view/user/login.dart';
import 'package:auto_doctor/sharedWidgets/widgets/AppTexts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ConfirmUser extends StatefulWidget {
  const ConfirmUser({Key? key}) : super(key: key);

  @override
  State<ConfirmUser> createState() => _ConfirmUserState();
}

class _ConfirmUserState extends State<ConfirmUser> {
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
                      fontSize: 22,
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
                            return LoginUser();
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
                        color: Color(0xfffab305),
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
