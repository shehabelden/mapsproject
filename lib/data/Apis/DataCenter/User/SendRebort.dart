import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../sharedWidgets/attention/customToast.dart';
import '../../../../sharedWidgets/loading/showAndHideLoader.dart';
import '../../../../view/user/HomeScreen.dart';
import '../../auth/user/auth_login.dart';
import '../../../models/RepotpRes.dart';

class Report {
  Future<ReportRes> sendReport(String ID_services_providers, String report,
      String price, BuildContext context) async {
    showLoading(context);
    Uri url =
        Uri.https('autorescue.services', '/api/app/v1/user/user/sendReport');
    var response = await http.post(url, body: {
      "idUser": AuthLoginUser.idUser.toString(),
      "ID_services_providers": ID_services_providers,
      "report": report,
      "prise": price,
    });

    var json = await jsonDecode(response.body);
    var data = await ReportRes.fromJson(json);
    if (data.data == 'yes') {
      hideLoading(context);
      showSuccessToast('Success');
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return HomeScreen();
        },
      ), (route) => false);
    } else {
      hideLoading(context);
      showFailedToast("There's error");
    }
    return data;
  }
}
