import 'package:auto_doctor/sharedWidgets/widgets/AppTexts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/Apis/auth/user/auth_login.dart';


class LoginUser extends StatefulWidget {
  const LoginUser({Key? key}) : super(key: key);

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  bool isVisible = true;
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
            crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 25,),
                Image(
                  image: AssetImage('assets/images/logoo_2.png'),
                ),
                SizedBox(height: 30,),
                TextFormField(
                  controller: phoneController,
                  style: TextStyle(fontSize: 12,),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 5,),
                TextFormField(
                  controller: passwordController,
                  style: TextStyle(fontSize: 12,),
                  obscureText: isVisible,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: IconButton(onPressed: (){
                      isVisible = !isVisible;
                      setState(() {
                      });
                    }, icon: Icon(isVisible == true ? Icons.visibility : Icons.visibility_off)),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15,),
                InkWell(
                  onTap: ()async{
                    await AuthLoginUser().login(
                        phoneController.text.toString(),
                        passwordController.text.toString(),context);
                  },
                  child:Container(
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
                          title: "LOG IN",
                          size: 15.sp,
                          color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Center(
                    child: Text("ــــــــــــــــــــــــــــــــــــــــــــــــــ Or Login With ــــــــــــــــــــــــــــــــــــــــــــــــــ",style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: (){},
                  child:  Container(
                    height: 38,
                    margin: EdgeInsets.symmetric(
                      horizontal: 35,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff009df1),
                    ),
                    child: Center(
                      child: AppTexts().customAppText(
                          title: "Login With Facebook",
                          size: 14.sp,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                InkWell(
                  onTap: (){},
                  child:  Container(
                    height: 38,
                    margin: EdgeInsets.symmetric(
                      horizontal: 35,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0x42f10000),
                    ),
                    child: Center(
                      child: AppTexts().customAppText(
                          title: "Login With Gmail",
                          size: 14.sp,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 0,
                ),
              ]
          ),
        ),
      ),
    );
  }
}
