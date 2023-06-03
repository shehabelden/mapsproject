import 'package:auto_doctor/data/Apis/auth/service/auth_register.dart';
import 'package:auto_doctor/sharedWidgets/widgets/AppTexts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SignInService extends StatefulWidget {
  const SignInService({Key? key}) : super(key: key);

  @override
  State<SignInService> createState() => _SignInServiceState();
}

class _SignInServiceState extends State<SignInService> {
  static List<String> type = ['Ambulance', 'Tires', 'Betrol Delivery' ,'Car Winsh','Mechanics Check', 'Computer Check', 'Electricity' ,'Battery Check',
    'Regular Maintenance', 'Car Washing'
  ];
  String? typeSelected ;
  bool isVisible = true;
  LatLng? currentPosition;
  bool isLoading = true;
  TextEditingController texRecordController = TextEditingController();
  TextEditingController centerNameController = TextEditingController();
  TextEditingController Regestrion_numberController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    getLocation();
    super.initState();
  }

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
                SizedBox(
                  height: 25,
                ),
                Image(
                  image: AssetImage('assets/images/logoo_2.png'),
                ),
                SizedBox(
                  height: 0,
                ),
                Text(
                  "Sign up With Us!",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: texRecordController,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Tex Record',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: centerNameController,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Center Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: Regestrion_numberController,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Registration Number',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),

                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButton(
                        underline: SizedBox(),
                        hint:Text(
                          "Type of Work",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ) ,
                        value:typeSelected,
                        items:type
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(), onChanged: (String? value) {
                        setState(() {
                          typeSelected = value!;
                        });
                      },),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                    child: TextFormField(
                      controller: priceController,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Price',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],),

                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: phoneController,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: passwordController,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  obscureText: isVisible,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                        onPressed: () {
                          isVisible = !isVisible;
                          setState(() {});
                        },
                        icon: Icon(isVisible == true
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    getLocation();
                    await AuthRegisterSer().registerServiceProvider(
                        texRecordController.text,
                        centerNameController.text,
                        Regestrion_numberController.text,
                        typeSelected??'notype',
                        priceController.text,
                        phoneController.text,
                        passwordController.text,
                        currentPosition!.longitude.toString(),
                        currentPosition!.latitude.toString(),
                        context,
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
                          title: "SIGN UP", size: 15.sp, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 0,
                ),
              ]),
        ),
      ),
    );
  }

  getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    double lat = position.latitude;
    double long = position.longitude;
    LatLng location = LatLng(lat, long);
      setState(() {
        currentPosition = location;
        isLoading = true;
      });
    }
  }
  // getLocation() async {
  //   LocationPermission permission;
  //   permission = await Geolocator.requestPermission();
  //   if(permission == LocationPermission.denied){
  //     permission = await Geolocator.requestPermission();
  //   }
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   double lat = position.latitude;
  //   double long = position.longitude;
  //
  //   LatLng location = LatLng(lat, long);
  //
  //   setState(() {
  //     currentPosition = location;
  //     isLoading = true;
  //   });
  // }
