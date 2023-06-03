class ServiceRes {
  List<Data>? data;

  ServiceRes({this.data});

  ServiceRes.fromJson(Map<String, dynamic> json) {
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
  String? prise;
  int? id;
  String? typeServ;
  String? lOT;
  String? long;
  String? phone;
  String? regestrionNumber;
  String? centerName;
  String? texRecord;

  Data(
      {this.prise,
        this.typeServ,
        this.lOT,
        this.id,
        this.long,
        this.phone,
        this.regestrionNumber,
        this.centerName,
        this.texRecord});

  Data.fromJson(Map<String, dynamic> json) {
    prise = json['prise'];
    typeServ = json['type_serv'];
    lOT = json['LOT'];
    id = json['id'];
    long = json['long'];
    phone = json['phone'];
    regestrionNumber = json['Regestrion_number'];
    centerName = json['centerName'];
    texRecord = json['texRecord'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prise'] = this.prise;
    data['type_serv'] = this.typeServ;
    data['LOT'] = this.lOT;
    data['id'] = this.id;
    data['long'] = this.long;
    data['phone'] = this.phone;
    data['Regestrion_number'] = this.regestrionNumber;
    data['centerName'] = this.centerName;
    data['texRecord'] = this.texRecord;
    return data;
  }
}
