import 'package:auto_doctor/data/Apis/auth/service/auth_login.dart';
import 'package:auto_doctor/sharedWidgets/widgets/AppTexts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginServic extends StatefulWidget {
  const LoginServic({Key? key}) : super(key: key);

  @override
  State<LoginServic> createState() => _LoginServicState();
}

class _LoginServicState extends State<LoginServic> {
  bool isVisible = true;
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                    await AuthLoginSer().login(
                        phoneController.text.toString(),
                        passwordController.text.toString(),context);
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
                          title: "LOG IN",
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
