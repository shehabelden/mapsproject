import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../models/RequestServiceRes.dart';
import '../../auth/service/auth_login.dart';
Future ReqActhion(String idData)async{
  Uri url = Uri.https('autorescue.services','/api/app/v1/service_provider/$idData');
  http.Response response = await http.get(url);
  var json = jsonDecode(response.body);
  return response.statusCode;
}