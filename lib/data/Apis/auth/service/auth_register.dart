import 'dart:convert';
import 'package:auto_doctor/sharedWidgets/attention/customToast.dart';
import 'package:auto_doctor/view/Service%20Provider/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../sharedWidgets/loading/showAndHideLoader.dart';
import '../../../models/RegisterResource.dart';
import 'auth_login.dart';

class AuthRegisterSer {
  Future<RegisterResource> registerServiceProvider(
      String texRecord,
      String centerName,
      String Regestrion_number,
      String typeSelected,
      String price,
      String phone,
      String password,
      String Lon,
      String lat,
      BuildContext context) async {
    showLoading(context);
    Uri url = Uri.https('autorescue.services', '/api/app/v1/service_provider/register');
    http.Response response = await http.post(url, body: {
      "texRecord": texRecord,
      "centerName": centerName,
      "Regestrion_number": Regestrion_number,
      "phone": phone,
      "password": password,
      "prise": price,
      "type_serv": typeSelected,
      "Lon": Lon,
      "lat": lat
    });
    dynamic json = await jsonDecode(response.body);
    var data = RegisterResource.fromJson(json);
    if(data.message == 'ok') {
      AuthLoginSer.idService = data.data!.id; //34

      showSuccessToast('Success');
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
        return HomeScreenProv();
      },), (route) => false);
    }else{showFailedToast(data.message??'');
    hideLoading(context);
    }
    return data;
  }
}
