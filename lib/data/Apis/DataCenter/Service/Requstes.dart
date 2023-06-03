import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../models/RequestServiceRes.dart';
import '../../auth/service/auth_login.dart';
Future<RequestServiceRes>getReqService()async{
  int? id = AuthLoginSer.idService;
  Uri url = Uri.https('autorescue.services','/api/app/v1/service_provider/get_all_req/$id');
  http.Response response = await http.get(url);
  var json = jsonDecode(response.body);
  return RequestServiceRes.fromJson(json);
}

Future<RequestServiceRes>getReqNotCompleatedService()async{
  int? id = AuthLoginSer.idService;
  Uri url = Uri.https('autorescue.services','/api/app/v1/service_provider/req_inuse/$id');
  http.Response response = await http.get(url);
  var json = jsonDecode(response.body);
  return RequestServiceRes.fromJson(json);
}