import 'dart:convert';
import 'package:auto_doctor/data/Apis/DataCenter/User/SendRebort.dart';
import 'package:auto_doctor/data/Apis/auth/user/auth_login.dart';
import 'package:auto_doctor/sharedWidgets/attention/customToast.dart';
import 'package:auto_doctor/sharedWidgets/loading/showAndHideLoader.dart';
import 'package:auto_doctor/view/user/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../models/RegisterResource.dart';
class AuthRegisterUser{
  Future<RegisterResource>register(String name,String phone,String password,BuildContext context)async{
    showLoading(context);
    Uri url = Uri.https('autorescue.services', '/api/app/v1/register');
    http.Response response = await http.post(url, body: {
      "name": name,
      "phone": phone,
      "password": password,
    });
    dynamic json = await jsonDecode(response.body);
    var data = RegisterResource.fromJson(json);
    if(response.statusCode == 200) {
      hideLoading(context);
      showSuccessToast('Success');
      AuthLoginUser.idUser = data.data!.id;
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
        return HomeScreen();
      },), (route) => false);
    }else{
      hideLoading(context);
      showFailedToast(data.message??'');}
    return data;
  }
}