class PropertyOwner {
  int userId;
  String firstName;
  String middleName;
  String otherNames;
  String email;
  int phoneNumber;

  PropertyOwner(
    this.userId,
    this.firstName,
    this.middleName,
    this.otherNames,
    this.email,
    this.phoneNumber,
  );

  factory PropertyOwner.fromJson(Map<String, dynamic> responseData) {
    return PropertyOwner(
      responseData['userId'],
      responseData['firstName'],
      responseData['middleName'],
      responseData['otherNames'],
      responseData['email'],
      responseData['phoneNumber'],
    );
  }
}
