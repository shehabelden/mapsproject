class RegisterResource {
  Data? data;
  String? message;

  RegisterResource({this.data, this.message});

  RegisterResource.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? texRecord;
  String? centerName;
  String? lon;
  String? phone;
  String? lOT;
  int? id;

  Data(
      {this.texRecord,
        this.centerName,
        this.lon,
        this.phone,
        this.lOT,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    texRecord = json['texRecord'];
    centerName = json['centerName'];
    lon = json['lon'];
    phone = json['phone'];
    lOT = json['LOT'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['texRecord'] = this.texRecord;
    data['centerName'] = this.centerName;
    data['lon'] = this.lon;
    data['phone'] = this.phone;
    data['LOT'] = this.lOT;
    data['id'] = this.id;
    return data;
  }
}
