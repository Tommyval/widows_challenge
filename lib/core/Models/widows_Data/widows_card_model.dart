// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WidowsCard {
  String? state;
  String? address;
  String? fullName;
  String? phoneNumber;
  DateTime dob;
  String? occupation;
  String? categoryBasedOnNeeds;
  String? accountName;
  String? lga;
  String? bankName;
  String? employmentStatus;
  int? yearOfMarriage;
  String? ngoMembership;
  String? homeTown;
  String? oneOrTwo;
  DateTime registrationDate;
  String? id;
  String? husbandBereavementDate;
  String? receivedBy;
  String? husbandName;
  String? husbandOccupation;
  String? accountNumber;
  String? ngoName;
  int? numberOfChildren;
  String? senatorialZone;
  String? image;
  WidowsCard({
    required this.state,
    required this.address,
    required this.fullName,
    required this.phoneNumber,
    required this.dob,
    required this.occupation,
    required this.categoryBasedOnNeeds,
    required this.accountName,
    required this.lga,
    required this.bankName,
    required this.employmentStatus,
    required this.yearOfMarriage,
    required this.ngoMembership,
    required this.homeTown,
    required this.oneOrTwo,
    required this.registrationDate,
    required this.id,
    required this.husbandBereavementDate,
    required this.receivedBy,
    required this.husbandName,
    required this.husbandOccupation,
    required this.accountNumber,
    required this.ngoName,
    required this.numberOfChildren,
    required this.senatorialZone,
    required this.image,
  });
  WidowsCard copyWith({
    String? state,
    String? address,
    String? fullName,
    String? phoneNumber,
    DateTime? dob,
    String? occupation,
    String? categoryBasedOnNeeds,
    String? accountName,
    String? lga,
    String? bankName,
    String? employmentStatus,
    int? yearOfMarriage,
    String? ngoMembership,
    String? homeTown,
    String? oneOrTwo,
    DateTime? registrationDate,
    String? id,
    String? husbandBereavementDate,
    String? receivedBy,
    String? husbandName,
    String? husbandOccupation,
    String? accountNumber,
    String? ngoName,
    int? numberOfChildren,
    String? senatorialZone,
    String? image,
  }) {
    return WidowsCard(
      state: state ?? this.state,
      address: address ?? this.address,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dob: dob ?? this.dob,
      occupation: occupation ?? this.occupation,
      categoryBasedOnNeeds: categoryBasedOnNeeds ?? this.categoryBasedOnNeeds,
      accountName: accountName ?? this.accountName,
      lga: lga ?? this.lga,
      bankName: bankName ?? this.bankName,
      employmentStatus: employmentStatus ?? this.employmentStatus,
      yearOfMarriage: yearOfMarriage ?? this.yearOfMarriage,
      ngoMembership: ngoMembership ?? this.ngoMembership,
      homeTown: homeTown ?? this.homeTown,
      oneOrTwo: oneOrTwo ?? this.oneOrTwo,
      registrationDate: registrationDate ?? this.registrationDate,
      id: id ?? this.id,
      husbandBereavementDate:
          husbandBereavementDate ?? this.husbandBereavementDate,
      receivedBy: receivedBy ?? this.receivedBy,
      husbandName: husbandName ?? this.husbandName,
      husbandOccupation: husbandOccupation ?? this.husbandOccupation,
      accountNumber: accountNumber ?? this.accountNumber,
      ngoName: ngoName ?? this.ngoName,
      numberOfChildren: numberOfChildren ?? this.numberOfChildren,
      senatorialZone: senatorialZone ?? this.senatorialZone,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'state': state,
      'address': address,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'dob': dob.millisecondsSinceEpoch,
      'occupation': occupation,
      'categoryBasedOnNeeds': categoryBasedOnNeeds,
      'accountName': accountName,
      'lga': lga,
      'bankName': bankName,
      'employmentStatus': employmentStatus,
      'yearOfMarriage': yearOfMarriage,
      'ngoMembership': ngoMembership,
      'homeTown': homeTown,
      'oneOrTwo': oneOrTwo,
      'registrationDate': registrationDate,
      'id': id,
      'husbandBereavementDate': husbandBereavementDate,
      'receivedBy': receivedBy,
      'husbandName': husbandName,
      'husbandOccupation': husbandOccupation,
      'accountNumber': accountNumber,
      'ngoName': ngoName,
      'numberOfChildren': numberOfChildren,
      'senatorialZone': senatorialZone,
      'image': image,
    };
  }

  factory WidowsCard.fromMap(Map<String, dynamic> json) {
    return WidowsCard(
      state: json['state'] as String?,
      address: json['address'] as String?,
      fullName: json['fullName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      dob: _parseDateTime(json['dob']),
      occupation: json['occupation'] as String?,
      categoryBasedOnNeeds: json['categoryBasedOnNeeds'] as String?,
      accountName: json['accountName'] as String?,
      lga: json['lga'] as String?,
      bankName: json['bankName'] as String?,
      employmentStatus: json['employmentStatus'] as String?,
      yearOfMarriage: json['yearOfMarriage'] as int,
      ngoMembership: json['ngoMembership'] as String?,
      homeTown: json['homeTown'] as String?,
      oneOrTwo: json['oneOrTwo'] as String?,
      registrationDate: _parseDateTime(json['registrationDate']),
      id: json['id'] as String?,
      husbandBereavementDate: json['husbandBereavementDate'] as String?,
      receivedBy: json['receivedBy'] as String?,
      husbandName: json['husbandName'] as String?,
      husbandOccupation: json['husbandOccupation'] as String?,
      accountNumber: json['accountNumber'] as String?,
      ngoName: json['ngoName'] as String?,
      numberOfChildren: json['numberOfChildren'] as int?,
      senatorialZone: json['senatorialZone'] as String?,
      image:
          'https://img.freepik.com/free-photo/man-isolated-showing-emotions-end-gestures_1303-30095.jpg',
    );
  }

  String toJson() => json.encode(toMap());

  factory WidowsCard.fromJson(String source) =>
      WidowsCard.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WidowsCard(state: $state, address: $address, fullName: $fullName, phoneNumber: $phoneNumber, dob: $dob, occupation: $occupation, categoryBasedOnNeeds: $categoryBasedOnNeeds, accountName: $accountName, lga: $lga, bankName: $bankName, employmentStatus: $employmentStatus, yearOfMarriage: $yearOfMarriage, ngoMembership: $ngoMembership, homeTown: $homeTown, oneOrTwo: $oneOrTwo, registrationDate: $registrationDate, id: $id, husbandBereavementDate: $husbandBereavementDate, receivedBy: $receivedBy, husbandName: $husbandName, husbandOccupation: $husbandOccupation, accountNumber: $accountNumber, ngoName: $ngoName, numberOfChildren: $numberOfChildren, senatorialZone: $senatorialZone, image: $image)';
  }

  @override
  bool operator ==(covariant WidowsCard other) {
    if (identical(this, other)) return true;

    return other.state == state &&
        other.address == address &&
        other.fullName == fullName &&
        other.phoneNumber == phoneNumber &&
        other.dob == dob &&
        other.occupation == occupation &&
        other.categoryBasedOnNeeds == categoryBasedOnNeeds &&
        other.accountName == accountName &&
        other.lga == lga &&
        other.bankName == bankName &&
        other.employmentStatus == employmentStatus &&
        other.yearOfMarriage == yearOfMarriage &&
        other.ngoMembership == ngoMembership &&
        other.homeTown == homeTown &&
        other.oneOrTwo == oneOrTwo &&
        other.registrationDate == registrationDate &&
        other.id == id &&
        other.husbandBereavementDate == husbandBereavementDate &&
        other.receivedBy == receivedBy &&
        other.husbandName == husbandName &&
        other.husbandOccupation == husbandOccupation &&
        other.accountNumber == accountNumber &&
        other.ngoName == ngoName &&
        other.numberOfChildren == numberOfChildren &&
        other.senatorialZone == senatorialZone &&
        other.image == image;
  }

  @override
  int get hashCode {
    return state.hashCode ^
        address.hashCode ^
        fullName.hashCode ^
        phoneNumber.hashCode ^
        dob.hashCode ^
        occupation.hashCode ^
        categoryBasedOnNeeds.hashCode ^
        accountName.hashCode ^
        lga.hashCode ^
        bankName.hashCode ^
        employmentStatus.hashCode ^
        yearOfMarriage.hashCode ^
        ngoMembership.hashCode ^
        homeTown.hashCode ^
        oneOrTwo.hashCode ^
        registrationDate.hashCode ^
        id.hashCode ^
        husbandBereavementDate.hashCode ^
        receivedBy.hashCode ^
        husbandName.hashCode ^
        husbandOccupation.hashCode ^
        accountNumber.hashCode ^
        ngoName.hashCode ^
        numberOfChildren.hashCode ^
        senatorialZone.hashCode ^
        image.hashCode;
  }
}

DateTime _parseDateTime(dynamic value) {
  if (value is int) {
    return DateTime.fromMillisecondsSinceEpoch(value);
  } else if (value is String) {
    return DateTime.tryParse(value) ?? DateTime.now();
  } else {
    return DateTime.now();
  }
}
