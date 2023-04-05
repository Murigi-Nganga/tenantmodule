class Tenant {
  Tenant({
    this.tenantId,
    this.idNumber,
    this.idType,
    this.tenantIdentifier,
    this.firstName,
    this.middleName,
    this.otherNames,
    this.pin,
    this.address,
    this.phoneNumber,
    this.emailAddress,
    this.vehicleRegistrationNumber,
    this.tenantType,
    this.registrationMode,
    this.tenantStatus,
    this.occupation,
    this.profilePhoto,
  });

  int? tenantId;
  String? idNumber;
  String? idType;
  String? tenantIdentifier;
  String? firstName;
  String? middleName;
  String? otherNames;
  String? pin;
  String? address;
  String? phoneNumber;
  String? emailAddress;
  String? vehicleRegistrationNumber;
  String? tenantType;
  String? registrationMode;
  String? tenantStatus;
  String? occupation;
  String? profilePhoto;

  factory Tenant.fromJson(Map<String, dynamic> json) => Tenant(
        tenantId: json["tenantID"],
        idNumber: json["idNumber"],
        idType: json["idType"],
        tenantIdentifier: json["tenantIdentifier"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        otherNames: json["otherNames"],
        pin: json["pin"],
        address: json["address"],
        phoneNumber: json["phoneNumber"],
        emailAddress: json["emailAddress"],
        vehicleRegistrationNumber: json["vehicleRegistrationNumber"],
        tenantType: json["tenantType"],
        registrationMode: json["registrationMode"],
        tenantStatus: json["tenantStatus"],
        occupation: json["occupation"],
        profilePhoto: json["profilePhoto"],
      );

  Map<String, dynamic> toJson() => {
        "tenantID": tenantId,
        "idNumber": idNumber,
        "idType": idType,
        "tenantIdentifier": tenantIdentifier,
        "firstName": firstName,
        "middleName": middleName,
        "otherNames": otherNames,
        "pin": pin,
        "address": address,
        "phoneNumber": phoneNumber,
        "emailAddress": emailAddress,
        "vehicleRegistrationNumber": vehicleRegistrationNumber,
        "tenantType": tenantType,
        "registrationMode": registrationMode,
        "tenantStatus": tenantStatus,
        "occupation": occupation,
        "profilePhoto": profilePhoto,
      };
}
