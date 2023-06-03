class ServicesModel {
  List<EmergencyModel>? emergencyModel;
  List<MaintenanceModel>? maintenanceModel;
  List<AnotherServiceModel>? anotherServiceModel;
  List<LocationModel>? locationModel;

  ServicesModel(
      {this.emergencyModel,
        this.maintenanceModel,
        this.anotherServiceModel,
        this.locationModel});

  ServicesModel.fromJson(Map<String, dynamic> json) {
    if (json['EmergencyModel'] != null) {
      emergencyModel = <EmergencyModel>[];
      json['EmergencyModel'].forEach((v) {
        emergencyModel!.add(new EmergencyModel.fromJson(v));
      });
    }
    if (json['MaintenanceModel'] != null) {
      maintenanceModel = <MaintenanceModel>[];
      json['MaintenanceModel'].forEach((v) {
        maintenanceModel!.add(new MaintenanceModel.fromJson(v));
      });
    }
    if (json['AnotherServiceModel'] != null) {
      anotherServiceModel = <AnotherServiceModel>[];
      json['AnotherServiceModel'].forEach((v) {
        anotherServiceModel!.add(new AnotherServiceModel.fromJson(v));
      });
    }
    if (json['locationModel'] != null) {
      locationModel = <LocationModel>[];
      json['locationModel'].forEach((v) {
        locationModel!.add(new LocationModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.emergencyModel != null) {
      data['EmergencyModel'] =
          this.emergencyModel!.map((v) => v.toJson()).toList();
    }
    if (this.maintenanceModel != null) {
      data['MaintenanceModel'] =
          this.maintenanceModel!.map((v) => v.toJson()).toList();
    }
    if (this.anotherServiceModel != null) {
      data['AnotherServiceModel'] =
          this.anotherServiceModel!.map((v) => v.toJson()).toList();
    }
    if (this.locationModel != null) {
      data['locationModel'] =
          this.locationModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EmergencyModel {
  int? id;
  String? name;
  String? type;

  EmergencyModel({this.id, this.name, this.type});

  EmergencyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    return data;
  }
}

class MaintenanceModel {
  int? id;
  String? name;
  String? type;

  MaintenanceModel({this.id, this.name, this.type});

  MaintenanceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    return data;
  }
}

class AnotherServiceModel {
  int? id;
  String? name;
  String? type;

  AnotherServiceModel({this.id, this.name, this.type});

  AnotherServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    return data;
  }
}

class LocationModel {
  String? centerName;
  String? location;

  LocationModel({this.centerName, this.location});

  LocationModel.fromJson(Map<String, dynamic> json) {
    centerName = json['centerName'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['centerName'] = this.centerName;
    data['location'] = this.location;
    return data;
  }
}
