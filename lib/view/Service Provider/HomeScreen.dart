import 'package:auto_doctor/sharedWidgets/navigating/myNavigator.dart';
import 'package:auto_doctor/view/Service%20Provider/Services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'HistoryService.dart';
import 'Login.dart';
import 'profile.dart';
import 'requests.dart';
import 'wallet.dart';


class HomeScreenProv extends StatefulWidget {
  const HomeScreenProv({Key? key}) : super(key: key);

  @override
  State<HomeScreenProv> createState() => _HomeScreenProvState();
}

class _HomeScreenProvState extends State<HomeScreenProv> {
  LatLng? currentPosition;
  bool isLoading = false;

  @override
  void initState() {
    getLocation();
    super.initState();
  }
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 252, 171, 48),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
             DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 252, 171, 48),
              ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: AssetImage('assets/images/IconApp2.png'),
                    ),
                  ],
                ),
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.black,
              ),
              title: const Text("Profile",
                  style: TextStyle(color: Colors.black,)
              ),
              onTap: (){
                Navigator.of(context) .push(
                    MaterialPageRoute(builder: (v){
                      return ProfileScreen();
                    })
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.wallet,
                color: Colors.black,
              ),
              title: const Text("Wallet",
                  style: TextStyle(color: Colors.black,)
              ),
              onTap: (){
                Navigator.of(context) .push(
                    MaterialPageRoute(builder: (v){
                      return AppWallet();
                    })
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.history_rounded,
                color: Colors.black,
              ),
              title: const Text("Current Requests",
                  style: TextStyle(color: Colors.black,)
              ),
              onTap: (){
                Navigator.of(context) .push(
                    MaterialPageRoute(builder: (v){
                      return HistoryService();
                    })
                );
              },
            ),

            // ListTile(
            //   leading: Icon(
            //     Icons.home_repair_service,
            //     color: Colors.black,
            //   ),
            //   title: const Text("Services",
            //       style: TextStyle(color: Colors.black,)
            //   ),
            //   onTap: (){
            //     Navigator.of(context) .push(
            //         MaterialPageRoute(builder: (v){
            //           return Services();
            //         })
            //     );
            //   },
            // ),
            ListTile(
              leading: Icon(
                Icons.manage_accounts,
                color: Colors.black,
              ),
              title: const Text("Support",
                  style: TextStyle(color: Colors.black,)
              ),
              onTap: (){},
            ),
            // ListTile(
            //   leading: Icon(
            //     Icons.settings_rounded,
            //     color: Colors.black,
            //   ),
            //   title: const Text("Setting",
            //       style: TextStyle(color: Colors.black,)
            //   ),
            //   onTap: (){},
            // ),
            ListTile(
              leading: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              title: const Text("Requests",
                  style: TextStyle(color: Colors.black,)
              ),
              onTap: (){
                Navigator.of(context) .push(
                    MaterialPageRoute(builder: (v){
                      return Requests();
                    })
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              title: const Text("Log Out",
                  style: TextStyle(color: Colors.black,)
              ),
              onTap: (){
                MyNavigetor().pushReplacementAndRemoveUtils(LoginServic(),context);
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
            initialCameraPosition: CameraPosition(
              target: currentPosition??LatLng(0, 0),
              zoom: 16.0,
            ),
          ),
        ],
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
    setState(()async {
       currentPosition = await location;
      isLoading = false;
    });
  }
}
