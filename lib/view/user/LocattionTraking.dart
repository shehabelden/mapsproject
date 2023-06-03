import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocattionTraking extends StatefulWidget {
  const LocattionTraking({Key? key}) : super(key: key);

  @override
  State<LocattionTraking> createState() => _LocattionTrakingState();
}

class _LocattionTrakingState extends State<LocattionTraking> {
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  static const LatLng destination = LatLng(37.33429383, -122.06600055);
  List<LatLng> polylineCoordinates = [];
  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyCcdAKl88zbn4ffPnuMvZdvUd5o953MkQ4",
      optimizeWaypoints: true,
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach(
            (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }
  @override
  void initState() {
getPolyPoints();
super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GoogleMap(

        initialCameraPosition: CameraPosition(target: sourceLocation,zoom: 13.5,),
      markers: {
        const Marker(
          markerId: MarkerId("source"),
          position: sourceLocation,
        ),
        const Marker(
          markerId: MarkerId("destination"),
          position: destination,
        ),
      },
        onMapCreated: (mapController) {
          _controller.complete(mapController);
      },
        // polylines: {
        //   Polyline(
        //     polylineId: const PolylineId("route"),
        //     points: polylineCoordinates,
        //     color: const Color(0xFF7B61FF),
        //     width: 6,
        //   ),
        // },
      ),
    );
  }
}
