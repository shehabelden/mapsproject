class RequestServiceRes {
  List<Data>? data;

  RequestServiceRes({this.data});

  RequestServiceRes.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? idUser;
  int? idSirviceProv;
  String? text;
  String? phone;
  String? notsFromService;
  int? prise;
  String? typeServ;
  String? phoneserv;

  Data(
      {this.id,
        this.idUser,
        this.idSirviceProv,
        this.text,
        this.phone,
        this.notsFromService,
        this.prise,
        this.typeServ,
        this.phoneserv});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUser = json['id_User'];
    idSirviceProv = json['id_sirvice_prov'];
    text = json['text_'];
    phone = json['phone'];
    notsFromService = json['nots_from_Service'];
    prise = json['prise'];
    typeServ = json['type_serv'];
    phoneserv = json['phoneserv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_User'] = this.idUser;
    data['id_sirvice_prov'] = this.idSirviceProv;
    data['text_'] = this.text;
    data['phone'] = this.phone;
    data['nots_from_Service'] = this.notsFromService;
    data['prise'] = this.prise;
    data['type_serv'] = this.typeServ;
    data['phoneserv'] = this.phoneserv;
    return data;
  }
}
