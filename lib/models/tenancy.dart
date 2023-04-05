import 'package:tenantmodule/models/property_unit.dart';

import 'invoice.dart';
import 'tenant.dart';

class Tenancy {
  Tenancy({
    this.tenancyId,
    this.propertyUnit,
    this.tenant,
    this.invoices,
    this.tenancyStatus,
    this.fromDate,
    this.toDate,
    this.rentAmount,
    this.actualRentAmount,
    this.rentDeposit,
    this.actualRentDeposit,
    this.otherDeposits,
    this.actualOtherDeposits,
    this.otherDepositsDescription,
    this.tenantId,
    this.propertyUnitId,
    this.active,
    this.propertyManagerId,
  });

  int? tenancyId;
  PropertyUnitShort? propertyUnit;
  Tenant? tenant;
  List<Invoice>? invoices;
  String? tenancyStatus;
  List<int>? fromDate;
  List<int>? toDate;
  double? rentAmount;
  double? actualRentAmount;
  double? rentDeposit;
  double? actualRentDeposit;
  double? otherDeposits;
  double? actualOtherDeposits;
  String? otherDepositsDescription;
  int? tenantId;
  int? propertyUnitId;
  bool? active;
  int? propertyManagerId;

  factory Tenancy.fromJson(Map<String, dynamic> json) => Tenancy(
        tenancyId: json["tenancyID"],
        propertyUnit: PropertyUnitShort.fromJson(json["propertyUnit"]),
        tenant: Tenant.fromJson(json["tenant"]),
        invoices: List<Invoice>.from(
            json["invoices"].map((x) => Invoice.fromJson(x))),
        tenancyStatus: json["tenancyStatus"],
        fromDate: List<int>.from(json["fromDate"].map((x) => x)),
        toDate: json["toDate"],
        rentAmount: json["rentAmount"],
        actualRentAmount: json["actualRentAmount"],
        rentDeposit: json["rentDeposit"],
        actualRentDeposit: json["actualRentDeposit"],
        otherDeposits: json["otherDeposits"],
        actualOtherDeposits: json["actualOtherDeposits"],
        otherDepositsDescription: json["otherDepositsDescription"],
        tenantId: json["tenantID"],
        propertyUnitId: json["propertyUnitID"],
        active: json["active"],
        propertyManagerId: json["propertyManagerID"],
      );

  Map<String, dynamic> toJson() => {
        "tenancyID": tenancyId,
        "propertyUnit": propertyUnit!.toJson(),
        "tenant": tenant!.toJson(),
        "invoices": List<dynamic>.from(invoices!.map((x) => x.toJson())),
        "tenancyStatus": tenancyStatus,
        "fromDate": List<dynamic>.from(fromDate!.map((x) => x)),
        "toDate": toDate,
        "rentAmount": rentAmount,
        "actualRentAmount": actualRentAmount,
        "rentDeposit": rentDeposit,
        "actualRentDeposit": actualRentDeposit,
        "otherDeposits": otherDeposits,
        "actualOtherDeposits": actualOtherDeposits,
        "otherDepositsDescription": otherDepositsDescription,
        "tenantID": tenantId,
        "propertyUnitID": propertyUnitId,
        "active": active,
        "propertyManagerID": propertyManagerId,
      };
}
