import 'package:auto_doctor/data/Apis/auth/user/auth_register.dart';
import 'package:auto_doctor/sharedWidgets/widgets/AppTexts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  bool isVisible = true;
  TextEditingController nameController = TextEditingController();
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
                SizedBox(
                  height: 0,),
                Text("Sign up With Us!", style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),),
                SizedBox(
                  height: 20,),
                TextFormField(
                  controller: nameController,
                          style: TextStyle(fontSize: 12,),
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                SizedBox(height: 5,),
                TextFormField(
                  controller: phoneController,
                  style: TextStyle(fontSize: 12,),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
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
                    await AuthRegisterUser().register(
                      nameController.text.toString(),
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
                      color: Color(0xfffab305),
                    ),
                    child: Center(
                      child: AppTexts().customAppText(
                          title: "SIGN UP",
                          size: 15.sp,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
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
                  height: 18,
                ),
                Container(
                  height: 38,
                  margin: EdgeInsets.symmetric(
                    horizontal: 35,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff009df1),
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Text("Sign up using Facebook", style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 38,
                  margin: EdgeInsets.symmetric(
                    horizontal: 35,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0x42f10000),
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Text("Sign up using Gmail", style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),),
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
