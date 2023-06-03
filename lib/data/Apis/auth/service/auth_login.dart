import 'dart:convert';

import 'package:auto_doctor/sharedWidgets/attention/customToast.dart';
import 'package:auto_doctor/sharedWidgets/loading/showAndHideLoader.dart';
import 'package:auto_doctor/view/Service%20Provider/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../models/RegisterResource.dart';

class AuthLoginSer {
  static int? idService;
  login(String phone, String password,BuildContext context)async {
    showLoading(context);
    Uri url = Uri.https('autorescue.services', '/api/app/v1/service_provider/login');
    http.Response response = await http.post(url, body: {
      "phone": phone,
      "password": password
    });
    dynamic json = await jsonDecode(response.body);
    var data = RegisterResource.fromJson(json);
    if(data.message == 'ok') {
      idService = data.data!.id;
      hideLoading(context);
      showSuccessToast('Success');
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
        return HomeScreenProv();
      },), (route) => false);
    }else{
      hideLoading(context);

      showFailedToast(data.message??'');}
    return data;
  }
  }
