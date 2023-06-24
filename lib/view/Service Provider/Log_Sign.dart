import 'package:auto_doctor/sharedWidgets/widgets/AppTexts.dart';
import 'package:auto_doctor/view/Service%20Provider/Login.dart';
import 'package:auto_doctor/view/Service%20Provider/Siginin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogSignServ extends StatefulWidget {
  const LogSignServ({Key? key}) : super(key: key);

  @override
  State<LogSignServ> createState() => _LogSignServState();
}

class _LogSignServState extends State<LogSignServ> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: _mediaQuery.size.height * 0.4,).copyWith(bottom: 0.0),
        width: double.infinity,
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 1,),
              Padding(
                padding: EdgeInsets.all(0,),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/images/logoo_2.png'),
                      ),
                      SizedBox(height: 0,),
                    ]
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 252, 171, 48),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45),
                    ),
                  ),
                  child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: _mediaQuery.size.height *0.1/2,
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.of(context) .push(
                                MaterialPageRoute(builder: (v){
                                  return LoginServic();
                                })
                            );
                          },
                          child: Container(
                            height: _mediaQuery.size.height * 0.1/2,
                            margin: EdgeInsets.symmetric(
                              horizontal: _mediaQuery.size.width * 0.3/2,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: AppTexts().customAppText(
                                  title: "LOG IN",
                                  size: 15.sp,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(height: _mediaQuery.size.height *0.1/9-2,
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.of(context) .push(
                                MaterialPageRoute(builder: (v){
                                  return SignInService();
                                })
                            );
                          },
                          child: Container(
                            height: _mediaQuery.size.height * 0.1/2,
                            margin: EdgeInsets.symmetric(
                              horizontal: _mediaQuery.size.width * 0.3/2,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: AppTexts().customAppText(
                                  title: "SIGN UP",
                                  size: 15.sp,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
