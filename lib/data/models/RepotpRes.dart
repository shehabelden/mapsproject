class ReportRes {
  String? data;
  String? stat;

  ReportRes({this.data,this.stat});

  ReportRes.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    stat = json['stat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    final Map<String, dynamic> stat = new Map<String, dynamic>();
    data['data'] = this.data;
    stat['stat'] = this.stat;
    return data;
  }
}
