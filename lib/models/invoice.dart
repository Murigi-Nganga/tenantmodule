class Invoice {
  int? invoiceID;
  String? invoiceNumber;
  double? invoiceAmount;
  String? invoiceStatus;
  String? unitCode;
  double? lastReading;
  double? currentReading;
  double? unitsUsed;
  double? waterCostPerUnit;
  double? currentWaterCost;
  double? previousWaterBalance;
  double? waterCostPayable;
  double? monthlyRent;
  double? previousRentBalance;
  double? rentPayable;
  double? totalPayable;
  List<int>? invoiceDate;
  String? invoiceMessage;

  Invoice(
      {this.invoiceID,
      this.invoiceNumber,
      this.invoiceAmount,
      this.invoiceStatus,
      this.unitCode,
      this.lastReading,
      this.currentReading,
      this.unitsUsed,
      this.waterCostPerUnit,
      this.currentWaterCost,
      this.previousWaterBalance,
      this.waterCostPayable,
      this.monthlyRent,
      this.previousRentBalance,
      this.rentPayable,
      this.totalPayable,
      this.invoiceDate,
      this.invoiceMessage});

  Invoice.fromJson(Map<String, dynamic> json) {
    invoiceID = json['invoiceID'];
    invoiceNumber = json['invoiceNumber'];
    invoiceAmount = json['invoiceAmount'];
    invoiceStatus = json['invoiceStatus'];
    unitCode = json['unitCode'];
    lastReading = json['lastReading'];
    currentReading = json['currentReading'];
    unitsUsed = json['unitsUsed'];
    waterCostPerUnit = json['waterCostPerUnit'];
    currentWaterCost = json['currentWaterCost'];
    previousWaterBalance = json['previousWaterBalance'];
    waterCostPayable = json['waterCostPayable'];
    monthlyRent = json['monthlyRent'];
    previousRentBalance = json['previousRentBalance'];
    rentPayable = json['rentPayable'];
    totalPayable = json['totalPayable'];
    invoiceDate = json['invoiceDate'].cast<int>();
    invoiceMessage = json['invoiceMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['invoiceID'] = invoiceID;
    data['invoiceNumber'] = invoiceNumber;
    data['invoiceAmount'] = invoiceAmount;
    data['invoiceStatus'] = invoiceStatus;
    data['unitCode'] = unitCode;
    data['lastReading'] = lastReading;
    data['currentReading'] = currentReading;
    data['unitsUsed'] = unitsUsed;
    data['waterCostPerUnit'] = waterCostPerUnit;
    data['currentWaterCost'] = currentWaterCost;
    data['previousWaterBalance'] = previousWaterBalance;
    data['waterCostPayable'] = waterCostPayable;
    data['monthlyRent'] = monthlyRent;
    data['previousRentBalance'] = previousRentBalance;
    data['rentPayable'] = rentPayable;
    data['totalPayable'] = totalPayable;
    data['invoiceDate'] = invoiceDate;
    data['invoiceMessage'] = invoiceMessage;
    return data;
  }
}
