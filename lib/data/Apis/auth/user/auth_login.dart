import 'dart:convert';

import 'package:auto_doctor/sharedWidgets/attention/customToast.dart';
import 'package:auto_doctor/sharedWidgets/loading/showAndHideLoader.dart';
import 'package:auto_doctor/view/user/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../models/RegisterResource.dart';

class AuthLoginUser {

  static int? idUser;

  Future<RegisterResource>login(String phone, String password,BuildContext context)async{
    showLoading(context);
    Uri url = Uri.https('autorescue.services', '/api/app/v1/login');
    http.Response response = await http.post(url, body: {
      "phone": phone,
      "password": password,
    });
    dynamic json = await jsonDecode(response.body);
    var data = RegisterResource.fromJson(json);
    if(response.statusCode == 200) {
      hideLoading(context);
      showSuccessToast('Success');
      idUser = data.data!.id;
      print(idUser);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
        return HomeScreen();
      },), (route) => false);
    }else{
      hideLoading(context);

      showFailedToast(data.message??'');}
    return data;

  }
}