import 'package:auto_doctor/view/screen/Usr&Srv.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds:4),(){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return UserOrServ();
      }));
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 171, 48),
      body: Center(
        child: Image(
          image: AssetImage('assets/images/logoo_1.png'),
        ),
      ),
    );
  }
}
