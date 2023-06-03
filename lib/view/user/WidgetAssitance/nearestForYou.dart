// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:auto_doctor/data/models/ServiceRes.dart';
import 'package:auto_doctor/utils/colors/appColors.dart';
import 'package:auto_doctor/sharedWidgets/spaces/customSizedBox.dart';
import 'package:auto_doctor/sharedWidgets/spaces/widthandheight.dart';
import 'package:auto_doctor/sharedWidgets/widgets/AppTexts.dart';
import 'package:auto_doctor/view/user/description_problem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../data/Apis/DataCenter/User/DataCenter.dart';
import '../../../data/mapData/locations.dart' as locations;
import '/sharedWidgets/widgets/AppImageWidgets.dart';


class NearestForYou extends StatefulWidget {
  final String nearest;
  final String id;
  const NearestForYou({
    Key? key,
    required this.nearest,
    required this.id
  }) : super(key: key);

  @override
  State<NearestForYou> createState() => _NearestForYouState();
}

class _NearestForYouState extends State<NearestForYou> {
  static double lat = 37.42796133580664;
  static double lon = -122.085749655962;
  static  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(lat, lon),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customSizedBox(0.0, 55.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: AppTexts().customAppText(
                  title: "Choose The Nearest ${widget.nearest} To You",
                  size: 20.sp,
                  color: Colors.black),
            ),
            const Divider(),
            customSizedBox(0.0, 35.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: getwidth(context) * 0.40,
                    height: getheight(context) * 0.25,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Column(
                      children: [
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: AppImages().assetImageWithWidthAndHeight(
                                "assets/images/avatar.png", 90.w, 80.h),
                          ),
                        ),
                        customSizedBox(0.0, 10.h),
                        AppTexts().customAppNormalText(
                            title: "${widget.nearest} 1", size: 12.sp),
                        AppTexts().customAppText(title: "560 Km", size: 15.sp)
                      ],
                    ),
                  ),
                  SizedBox(
                    width: getwidth(context) * 0.45,
                    height: getheight(context) * 0.25,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: _onMapCreated,
                      markers: _markers.values.toSet(),
                      myLocationEnabled: true,
                    ),
                  )
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(20.0),
                  //   child: AppImages().assetImageWithWidthAndHeight(
                  //       "assets/images/mapEx.jpeg",
                  //       getwidth(context) * 0.45,
                  //       getheight(context) * 0.2),
                  // )
                ],
              ),
            ),
            customSizedBox(0.0, 35.h),
            const Divider(),
            Center(
              child: AppTexts().customAppNormalText(title: "OR", size: 18.sp),
            ),
            customSizedBox(0.0, 35.h),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.orangeColor,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Center(
                      child: AppTexts().customAppText(
                          title: "More Centers",
                          size: 18.sp,
                          color: Colors.black),
                    ),
                  ),
                  customSizedBox(0.0, 10.h),
                  FutureBuilder<ServiceRes>(
                    future:getDataService(service: widget.id) ,
                    builder: (context, snapshot) {
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return CircularProgressIndicator();
                      }
                      var data = snapshot.data?.data;
                    return  ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: data?.length??0,
                        itemBuilder: (BuildContext context, int index) {
                          lat = double.parse(data?[index].lOT??'-122.085749655962');
                          lon = double.parse(data?[index].long??'37.42796133580664');
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          AppTexts().customAppText(
                                              title:
                                              data![index].centerName??'',
                                              size: 15.sp,
                                              color: AppColors.whiteColor),
                                          Padding(
                                            padding: EdgeInsets.only(left: 50.w),
                                            child: AppTexts().customAppNormalText(
                                                title: "> 980Km",
                                                size: 12.sp,
                                                color: Colors.black),
                                          ),
                                          AppTexts().customAppText(
                                              title:'Price : ${data?[index].prise??''}',
                                              size: 15.sp,
                                              color: AppColors.whiteColor),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.telegram,
                                                color: Colors.white,
                                              ))
                                        ]),
                                    InkWell(
                                      onTap: (){
                                        Navigator.of(context) .push(
                                            MaterialPageRoute(builder: (v){
                                              return DescriptionProblem(data: data[index],);
                                            })
                                        );
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(50.0)),
                                        child: const Icon(Icons.arrow_forward),
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                )
                              ],
                            ),
                          );
                        });

                  },)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    // final Uint8List markerIcon = await getBytesFromAsset(logoAsset, 100);
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          // icon: BitmapDescriptor.fromBytes(markerIcon),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }
}
