// Property Units receiced in the fetchUnitByStatus (where status = 'VACANT') 
//response body map to this class
class PropertyUnitLong {
  PropertyUnitLong({
    this.unitID,
    this.unitCode,
    this.unitName,
    this.unitDescription,
    this.rentAmount,
    this.propertyID,
    this.propertyCode,
    this.propertyName,
    this.propertyDescription,
    this.rentFrequency,
    this.coverPhotoUrl,
    this.coverVideoUrl,
    this.unitStatus,
    this.contactName,
    this.contactPhoneNumber,
  });

  int? unitID;
  String? unitCode;
  String? unitName;
  String? unitDescription;
  double? rentAmount;
  int? propertyID;
  String? propertyCode;
  String? propertyName;
  String? propertyDescription;
  String? rentFrequency;
  String? coverPhotoUrl;
  String? coverVideoUrl;
  String? unitStatus;
  String? contactName;
  String? contactPhoneNumber;

  factory PropertyUnitLong.fromJson(Map<String?, dynamic> json) {
    return PropertyUnitLong(
      unitID: json['unitID'],
      unitCode: json['unitCode'],
      unitName: json['unitName'],
      unitDescription: json['unitDescription'],
      rentAmount: json['rentAmount'],
      propertyID: json['propertyID'],
      propertyCode: json['propertyCode'],
      propertyName: json['propertyName'],
      propertyDescription: json['propertyDescription'],
      rentFrequency: json['rentFrequency'],
      coverPhotoUrl: json['coverPhotoUrl'],
      coverVideoUrl: json['coverVideoUrl'],
      unitStatus: json['unitStatus'],
      contactName: json['contactName'],
      contactPhoneNumber: json['contactPhoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'unitID': unitID,
      'unitCode': unitCode,
      'unitName': unitName,
      'unitDescription': unitDescription,
      'rentAmount': rentAmount,
      'propertyID': propertyID,
      'propertyCode': propertyCode,
      'propertyName': propertyDescription,
      'propertyDescription': propertyDescription,
      'rentFrequency': rentFrequency,
      'coverPhotoUrl': coverPhotoUrl,
      'coverVideoUrl': coverVideoUrl,
      'unitStatus': unitStatus,
      'contactName': contactName,
      'contactPhoneNumber': contactPhoneNumber,
    };
  }
}

// Property Units receiced in the fetchTenancyByIdNumber response body 
// map to this class
class PropertyUnitShort {
  PropertyUnitShort({
    this.unitId,
    this.unitCode,
    this.unitName,
    this.unitDescription,
    this.rentAmount,
    this.rentDepositAmount,
    this.electricityMeter,
    this.waterMeter,
    this.electricityMeterShare,
    this.waterMeterShare,
    this.unitStatus,
    this.propertyId,
  });

  int? unitId;
  String? unitCode;
  String? unitName;
  String? unitDescription;
  double? rentAmount;
  double? rentDepositAmount;
  String? electricityMeter;
  String? waterMeter;
  String? electricityMeterShare;
  String? waterMeterShare;
  String? unitStatus;
  int? propertyId;

  factory PropertyUnitShort.fromJson(Map<String, dynamic> json) =>
      PropertyUnitShort(
        unitId: json["unitID"],
        unitCode: json["unitCode"],
        unitName: json["unitName"],
        unitDescription: json["unitDescription"],
        rentAmount: json["rentAmount"],
        rentDepositAmount: json["rentDepositAmount"],
        electricityMeter: json["electricityMeter"],
        waterMeter: json["waterMeter"],
        electricityMeterShare: json["electricityMeterShare"],
        waterMeterShare: json["waterMeterShare"],
        unitStatus: json["unitStatus"],
        propertyId: json["propertyID"],
      );

  Map<String, dynamic> toJson() => {
        "unitID": unitId,
        "unitCode": unitCode,
        "unitName": unitName,
        "unitDescription": unitDescription,
        "rentAmount": rentAmount,
        "rentDepositAmount": rentDepositAmount,
        "electricityMeter": electricityMeter,
        "waterMeter": waterMeter,
        "electricityMeterShare": electricityMeterShare,
        "waterMeterShare": waterMeterShare,
        "unitStatus": unitStatus,
        "propertyID": propertyId,
      };
}
