import 'dart:convert';
import 'package:auto_doctor/sharedWidgets/attention/customToast.dart';
import 'package:http/http.dart' as http;
import '../models/services_model.dart';


class ServicesApi{
  GetAllService()async{
    ServicesModel? servicesModel;
    var request = http.Request('GET', Uri.parse('https://autorescue.services/api/user/user/Home'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var servicesModelResponse = json.decode(await response.stream.bytesToString());
      servicesModel = ServicesModel.fromJson(servicesModelResponse);
      return servicesModel;
    }
    else {
      showFailedToast(response.reasonPhrase.toString());
    }
  }
}