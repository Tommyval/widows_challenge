import 'dart:convert';

List<ChartModel> chartModelFromJson(String str) =>
    List<ChartModel>.from(json.decode(str).map((x) => ChartModel.fromJson(x)));

String chartModelToJson(List<ChartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChartModel {
  // Null? ngoName;
  String? fullName;
  String? husbandOccupation;
  // Null? accountName;
  String? address;
  String? ngoMembership;
  String? husbandName;
  String? employmentStatus;
  String? state;
  int? numberOfChildren;
  String? occupation;
  String? id;
  String? dob;
  String? phoneNumber;
  String? husbandBereavementDate;
  String? homeTown;
  // Null? bankName;
  String? senatorialZone;
  String? lga;
  int? yearOfMarriage;
  // Null? accountNumber;
  String? categoryBasedOnNeeds;
  //Null? oneOrTwo;
  String? registrationDate;
  // Null? receivedBy;

  ChartModel({
    //this.ngoName,
    this.fullName,
    this.husbandOccupation,
    //this.accountName,
    this.address,
    this.ngoMembership,
    this.husbandName,
    this.employmentStatus,
    this.state,
    this.numberOfChildren,
    this.occupation,
    this.id,
    this.dob,
    this.phoneNumber,
    this.husbandBereavementDate,
    this.homeTown,
    // this.bankName,
    this.senatorialZone,
    this.lga,
    this.yearOfMarriage,
    //this.accountNumber,
    this.categoryBasedOnNeeds,
    //this.oneOrTwo,
    this.registrationDate,
    //this.receivedBy
  });

  ChartModel.fromJson(Map<String, dynamic> json) {
    // ngoName = json['ngoName'];
    fullName = json['fullName'];
    husbandOccupation = json['husbandOccupation'];
    // accountName = json['accountName'];
    address = json['address'];
    ngoMembership = json['ngoMembership'];
    husbandName = json['husbandName'];
    employmentStatus = json['employmentStatus'];
    state = json['state'];
    numberOfChildren = json['numberOfChildren'];
    occupation = json['occupation'];
    id = json['id'];
    dob = json['dob'];
    phoneNumber = json['phoneNumber'];
    husbandBereavementDate = json['husbandBereavementDate'];
    homeTown = json['homeTown'];
    // bankName = json['bankName'];
    senatorialZone = json['senatorialZone'];
    lga = json['lga'];
    yearOfMarriage = json['yearOfMarriage'];
    //  accountNumber = json['accountNumber'];
    categoryBasedOnNeeds = json['categoryBasedOnNeeds'];
    //  oneOrTwo = json['oneOrTwo'];
    registrationDate = json['registrationDate'];
    // receivedBy = json['receivedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['ngoName'] = this.ngoName;
    data['fullName'] = fullName;
    data['husbandOccupation'] = husbandOccupation;
    //data['accountName'] = this.accountName;
    data['address'] = address;
    data['ngoMembership'] = ngoMembership;
    data['husbandName'] = husbandName;
    data['employmentStatus'] = employmentStatus;
    data['state'] = state;
    data['numberOfChildren'] = numberOfChildren;
    data['occupation'] = occupation;
    data['id'] = id;
    data['dob'] = dob;
    data['phoneNumber'] = phoneNumber;
    data['husbandBereavementDate'] = husbandBereavementDate;
    data['homeTown'] = homeTown;
    // data['bankName'] = this.bankName;
    data['senatorialZone'] = senatorialZone;
    data['lga'] = lga;
    data['yearOfMarriage'] = yearOfMarriage;
    // data['accountNumber'] = this.accountNumber;
    data['categoryBasedOnNeeds'] = categoryBasedOnNeeds;
    // data['oneOrTwo'] = this.oneOrTwo;
    data['registrationDate'] = registrationDate;
    // data['receivedBy'] = this.receivedBy;
    return data;
  }
}
