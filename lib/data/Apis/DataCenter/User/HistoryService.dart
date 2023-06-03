import '../../../models/RepotpRes.dart';
import '../../../models/RequestServiceRes.dart';
import '../../auth/user/auth_login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
Future<RequestServiceRes>getHistoryService()async{
  int? id = AuthLoginUser.idUser;
  Uri url = Uri.https('autorescue.services','/api/app/v1/user/user/carent_req/$id');
  http.Response response = await http.get(url);
  var json = jsonDecode(response.body);
  return RequestServiceRes.fromJson(json);
}

Future<RequestServiceRes>getCheckOut()async{
  int? id = AuthLoginUser.idUser;
  Uri url = Uri.https('autorescue.services','/api/app/v1/user/user/check_get/$id');
  http.Response response = await http.get(url);
  var json = jsonDecode(response.body);
  return RequestServiceRes.fromJson(json);
}

Future checkOut({required String idService})async{
  int? id = AuthLoginUser.idUser;
  Uri url = Uri.https('autorescue.services','/api/app/v1/user/user/chek_at');
  http.Response response = await http.post(url,body: {
    "id" : id.toString(),
    "id_req" : idService
  });

  return response.body;
}

Future<ReportRes>getBalance()async{
  int? id = AuthLoginUser.idUser;
  Uri url = Uri.https('autorescue.services','/api/app/v1/user/user/getmo/$id');
  http.Response response = await http.get(url);
  var json = jsonDecode(response.body);
  return ReportRes.fromJson(json);
}


