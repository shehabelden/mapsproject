import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearbyCenteres extends StatefulWidget {
  const NearbyCenteres({Key? key}) : super(key: key);

  @override
  State<NearbyCenteres> createState() => _NearbyCenteresState();
}

class _NearbyCenteresState extends State<NearbyCenteres> {
  LatLng? currentPosition;
  bool isLoading = true;

  @override
  void initState() {
    getLocation();
    super.initState();
  }
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
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
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            initialCameraPosition: CameraPosition(
              target: currentPosition!,
              zoom: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double lat = position.latitude;
    double long = position.longitude;

    LatLng location = LatLng(lat, long);

    setState(() {
      currentPosition = location;
      isLoading = false;
    });
  }
}
