// To parse this JSON data, do
//
//     final chart = chartFromJson(jsonString);

import 'dart:convert';

List<Chart?>? chartFromJson(String str) => json.decode(str) == null
    ? []
    : List<Chart?>.from(json.decode(str)!.map((x) => Chart.fromJson(x)));

String chartToJson(List<Chart?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class Chart {
  Chart({
    this.ngoName,
    this.fullName,
    this.husbandOccupation,
    this.accountName,
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
    this.bankName,
    this.senatorialZone,
    this.lga,
    this.yearOfMarriage,
    this.accountNumber,
    this.categoryBasedOnNeeds,
    this.oneOrTwo,
    this.registrationDate,
    this.receivedBy,
  });

  NgoName? ngoName;
  String? fullName;
  String? husbandOccupation;
  String? accountName;
  String? address;
  NgoMembership? ngoMembership;
  String? husbandName;
  EmploymentStatus? employmentStatus;
  State? state;
  int? numberOfChildren;
  String? occupation;
  String? id;
  DateTime? dob;
  String? phoneNumber;
  String? husbandBereavementDate;
  HomeTown? homeTown;
  BankName? bankName;
  SenatorialZone? senatorialZone;
  Lga? lga;
  int? yearOfMarriage;
  String? accountNumber;
  CategoryBasedOnNeeds? categoryBasedOnNeeds;
  int? oneOrTwo;
  DateTime? registrationDate;
  ReceivedBy? receivedBy;

  factory Chart.fromJson(Map<String, dynamic> json) => Chart(
        ngoName: json["ngoName"],
        fullName: json["fullName"],
        husbandOccupation: json["husbandOccupation"],
        accountName: json["accountName"],
        address: json["address"],
        ngoMembership: ngoMembershipValues.map[json["ngoMembership"]],
        husbandName: json["husbandName"],
        employmentStatus: employmentStatusValues.map[json["employmentStatus"]],
        state: stateValues.map[json["state"]],
        numberOfChildren: json["numberOfChildren"],
        occupation: json["occupation"],
        id: json["id"],
        dob: DateTime.parse(json["dob"]),
        phoneNumber: json["phoneNumber"],
        husbandBereavementDate: json["husbandBereavementDate"],
        homeTown: homeTownValues.map[json["homeTown"]],
        bankName: json["bankName"],
        senatorialZone: json["senatorialZone"],
        lga: lgaValues.map[json["lga"]],
        yearOfMarriage: json["yearOfMarriage"],
        accountNumber: json["accountNumber"],
        categoryBasedOnNeeds: json["categoryBasedOnNeeds"],
        oneOrTwo: json["oneOrTwo"],
        registrationDate: DateTime.parse(json["registrationDate"]),
        receivedBy: json["receivedBy"],
      );

  Map<String, dynamic> toJson() => {
        "ngoName": ngoName,
        "fullName": fullName,
        "husbandOccupation": husbandOccupation,
        "accountName": accountName,
        "address": address,
        "ngoMembership": ngoMembershipValues.reverse![ngoMembership],
        "husbandName": husbandName,
        "employmentStatus": employmentStatusValues.reverse![employmentStatus],
        "state": stateValues.reverse![state],
        "numberOfChildren": numberOfChildren,
        "occupation": occupation,
        "id": id,
        "dob": dob?.toIso8601String(),
        "phoneNumber": phoneNumber,
        "husbandBereavementDate": husbandBereavementDate,
        "homeTown": homeTownValues.reverse![homeTown],
        "bankName": bankName,
        "senatorialZone": senatorialZone,
        "lga": lgaValues.reverse![lga],
        "yearOfMarriage": yearOfMarriage,
        "accountNumber": accountNumber,
        "categoryBasedOnNeeds": categoryBasedOnNeeds,
        "oneOrTwo": oneOrTwo,
        "registrationDate": registrationDate?.toIso8601String(),
        "receivedBy": receivedBy,
      };
}

enum BankName {
  POLARIS,
  ZENITH_BANK,
  HERITAGE_BANK,
  KEYSTONE_BANK,
  POLARIS_BANK,
  FIRST_BANK,
  BANK_NAME_HERITAGE_BANK,
  BANK_NAME_KEYSTONE_BANK,
  BANK_NAME_FIRST_BANK,
  GT_BANK,
  WEMA_BANK,
  BANK_NAME_POLARIS_BANK,
  PURPLE_HERITAGE_BANK,
  WEMA,
  PURPLE_KEYSTONE_BANK,
  PURPLE_POLARIS_BANK,
  ECO_BANK,
  UNION_BANK,
  FIRST_BANK_PLC,
  HERITAGE_BANK_IKARE,
  FCMB,
  ACCESS_BANK,
  SAVINGS,
  UBA_BANK,
  BANK_NAME_WEMA_BANK,
  KEYSTONE,
  FLUFFY_HERITAGE_BANK,
  BANK_NAME_ACCESS_BANK,
  BANK_NAME_ZENITH_BANK,
  ECOBANK,
  BANK_NAME_UBA_BANK,
  PURPLE_ACCESS_BANK,
  SCANING_BANK,
  BANK_NAME_POLARIS,
  UBA,
  PURPLE_FIRST_BANK,
  PURPLE_WEMA_BANK,
  BANK_NAME_KEYSTONE,
  BANK_NAME_ECOBANK,
  STERLING_BANK,
  FLUFFY_POLARIS_BANK,
  BANK_NAME_FIRST_BANK_PLC,
  FLUFFY_ACCESS_BANK,
  GTB,
  FLUFFY_FIRST_BANK,
  GUARANTY_TRUST_BANK,
  POLARISBANK,
  PURPLE_FIRST_BANK_PLC,
  TENTACLED_HERITAGE_BANK,
  PURPLE_KEYSTONE,
  FIRSTBANK,
  PURPLE_ZENITH_BANK,
  TENTACLED_POLARIS_BANK,
  BANK_NAME_UBA,
  BANK_NAME_ECO_BANK,
  BANK_NAME_UNION_BANK,
  KEY_STONE_BANK,
  POLARIS_BANK_IKARE,
  HERITAGE,
  UNITED_BANK_OF_AFRICA,
  FIRST_BANK_OF_NIGERIA,
  ECO,
  FLUFFY_ZENITH_BANK,
  POLARISE_BANK,
  BANK_NAME_STERLING_BANK,
  ZENITH,
  WEMA_BANK_PLC,
  WEMABANK,
  BANK_NAME_HERITAGE,
  KEY_STONE,
  ACCESS_DIAMOND_BANKF,
  BANK_NAME_GTB,
  PURPLE_UNION_BANK,
  FIRST_CITY_MONUMENT_BANK,
  ACCESS,
  BANK_NAME_WEMA,
  PURPLE_POLARIS,
  STANBIC_IBTC,
  ABIODUN_OLUWASEYI_OLAJIDE
}

final bankNameValues = EnumValues({
  "ABIODUN OLUWASEYI OLAJIDE": BankName.ABIODUN_OLUWASEYI_OLAJIDE,
  "Access": BankName.ACCESS,
  "ACCESS BANK": BankName.ACCESS_BANK,
  "ACCESS (diamond) bankf": BankName.ACCESS_DIAMOND_BANKF,
  "Access Bank": BankName.BANK_NAME_ACCESS_BANK,
  "Ecobank ": BankName.BANK_NAME_ECOBANK,
  "Eco bank": BankName.BANK_NAME_ECO_BANK,
  "First Bank": BankName.BANK_NAME_FIRST_BANK,
  "First Bank PLC": BankName.BANK_NAME_FIRST_BANK_PLC,
  "GTB": BankName.BANK_NAME_GTB,
  "HERITAGE": BankName.BANK_NAME_HERITAGE,
  "HERITAGE BANK": BankName.BANK_NAME_HERITAGE_BANK,
  "Keystone": BankName.BANK_NAME_KEYSTONE,
  "KEYSTONE BANK": BankName.BANK_NAME_KEYSTONE_BANK,
  "polaris": BankName.BANK_NAME_POLARIS,
  "POLARIS BANK": BankName.BANK_NAME_POLARIS_BANK,
  "STERLING BANK": BankName.BANK_NAME_STERLING_BANK,
  "UBA": BankName.BANK_NAME_UBA,
  "UBA Bank": BankName.BANK_NAME_UBA_BANK,
  "Union bank": BankName.BANK_NAME_UNION_BANK,
  "WEMA": BankName.BANK_NAME_WEMA,
  "Wema bank": BankName.BANK_NAME_WEMA_BANK,
  "Zenith Bank": BankName.BANK_NAME_ZENITH_BANK,
  "Eco": BankName.ECO,
  "Ecobank": BankName.ECOBANK,
  "ECO BANK": BankName.ECO_BANK,
  "FCMB": BankName.FCMB,
  "Firstbank": BankName.FIRSTBANK,
  "FIRST BANK": BankName.FIRST_BANK,
  "First Bank of Nigeria ": BankName.FIRST_BANK_OF_NIGERIA,
  "First Bank Plc": BankName.FIRST_BANK_PLC,
  "First City Monument Bank": BankName.FIRST_CITY_MONUMENT_BANK,
  "Access Bank ": BankName.FLUFFY_ACCESS_BANK,
  "First Bank ": BankName.FLUFFY_FIRST_BANK,
  "Heritage bank": BankName.FLUFFY_HERITAGE_BANK,
  "Polaris bank ": BankName.FLUFFY_POLARIS_BANK,
  "Zenith bank": BankName.FLUFFY_ZENITH_BANK,
  "Gtb": BankName.GTB,
  "GT BANK": BankName.GT_BANK,
  "Guaranty Trust Bank": BankName.GUARANTY_TRUST_BANK,
  "Heritage": BankName.HERITAGE,
  "Heritage bank ": BankName.HERITAGE_BANK,
  "Heritage Bank, Ikare": BankName.HERITAGE_BANK_IKARE,
  "Keystone ": BankName.KEYSTONE,
  "Keystone Bank": BankName.KEYSTONE_BANK,
  "KEY STONE": BankName.KEY_STONE,
  "KEY STONE BANK": BankName.KEY_STONE_BANK,
  "POLARIS": BankName.POLARIS,
  "POLARISBANK": BankName.POLARISBANK,
  "Polarise Bank": BankName.POLARISE_BANK,
  "Polaris bank": BankName.POLARIS_BANK,
  "Polaris Bank, Ikare": BankName.POLARIS_BANK_IKARE,
  "Access bank": BankName.PURPLE_ACCESS_BANK,
  "First bank": BankName.PURPLE_FIRST_BANK,
  "FIRST BANK PLC": BankName.PURPLE_FIRST_BANK_PLC,
  "HERITAGE BANK ": BankName.PURPLE_HERITAGE_BANK,
  "KEYSTONE": BankName.PURPLE_KEYSTONE,
  "Keystone bank": BankName.PURPLE_KEYSTONE_BANK,
  "Polaris": BankName.PURPLE_POLARIS,
  "Polaris Bank": BankName.PURPLE_POLARIS_BANK,
  "Union Bank ": BankName.PURPLE_UNION_BANK,
  "WEMA BANK ": BankName.PURPLE_WEMA_BANK,
  "ZENITH BANK ": BankName.PURPLE_ZENITH_BANK,
  "Savings": BankName.SAVINGS,
  "SCANING BANK": BankName.SCANING_BANK,
  "Stanbic IBTC": BankName.STANBIC_IBTC,
  "Sterling Bank": BankName.STERLING_BANK,
  "Heritage Bank": BankName.TENTACLED_HERITAGE_BANK,
  " Polaris bank": BankName.TENTACLED_POLARIS_BANK,
  "Uba": BankName.UBA,
  "UBA BANK": BankName.UBA_BANK,
  "UNION BANK": BankName.UNION_BANK,
  "UNITED BANK OF AFRICA": BankName.UNITED_BANK_OF_AFRICA,
  "Wema": BankName.WEMA,
  "Wemabank": BankName.WEMABANK,
  "WEMA BANK": BankName.WEMA_BANK,
  "WEMA Bank PLC": BankName.WEMA_BANK_PLC,
  "Zenith": BankName.ZENITH,
  "ZENITH BANK": BankName.ZENITH_BANK
});

enum CategoryBasedOnNeeds { LEVEL_3, LEVEL_4, LEVEL_5, LEVEL_2, LEVEL_1 }

final categoryBasedOnNeedsValues = EnumValues({
  "Level 1": CategoryBasedOnNeeds.LEVEL_1,
  "Level 2": CategoryBasedOnNeeds.LEVEL_2,
  "Level 3": CategoryBasedOnNeeds.LEVEL_3,
  "Level 4": CategoryBasedOnNeeds.LEVEL_4,
  "Level 5": CategoryBasedOnNeeds.LEVEL_5
});

enum EmploymentStatus {
  SELF_EMPLOYED,
  UNEMPLOYED,
  EMPLOYED,
  PENSIONER,
  EMPLOYMENT_STATUS,
  EMPLOYMENT_STATUS_SELF_EMPLOYED
}

final employmentStatusValues = EnumValues({
  "Employed": EmploymentStatus.EMPLOYED,
  "Employment Status": EmploymentStatus.EMPLOYMENT_STATUS,
  "Self-Employed": EmploymentStatus.EMPLOYMENT_STATUS_SELF_EMPLOYED,
  "Pensioner": EmploymentStatus.PENSIONER,
  "Self Employed": EmploymentStatus.SELF_EMPLOYED,
  "Unemployed": EmploymentStatus.UNEMPLOYED
});

enum HomeTown {
  IKARE,
  IKARE_AKOKO,
  OWO,
  HOME_TOWN_IKARE_AKOKO,
  ERUSU_AKOKO,
  ONDO_STATE,
  HOME_TOWN_IKARE,
  IBARAM_AKOKO,
  IKARE_A_KOKO,
  PURPLE_IKARE_AKOKO,
  AUGA_AKOKO,
  AKUNU,
  AKUNGBA,
  ISE_AKOKO,
  OSOGBO,
  AFIN_AKOKO,
  FLUFFY_IKARE_AKOKO,
  EKAN_IKARE_AKOLO,
  TENTACLED_IKARE_AKOKO,
  ISHE_AKOKO,
  UGBE_AKOKO,
  HOME_TOWN_AUGA_AKOKO,
  STICKY_IKARE_AKOKO,
  PURPLE_AUGA_AKOKO,
  IRUN_AKOKO,
  IBOROPA_AKOKO,
  IPESI,
  HOME_TOWN_IBOROPA_AKOKO,
  PURPLE_IKARE,
  AKOKO,
  HOME_TOWN_UGBE_AKOKO,
  INDIGO_IKARE_AKOKO,
  AKUNU_AKOKO,
  HOME_TOWN_AKOKO,
  HOME_TOWN_AFIN_AKOKO,
  GEDEGEDE_AKOKO,
  PURPLE_IBOROPA_AKOKO,
  INDECENT_IKARE_AKOKO,
  AJOWA_AKOKO,
  I,
  AGBO_OKELA,
  OKITIPUPA,
  IKARAMU_AKOKO,
  HOME_TOWN_ISE_AKOKO,
  OGBAGI_AKOKO,
  IKARE_AKOKO_ONDO_STATE,
  OGHEGHE,
  IKAKUMO_AKOKO,
  HILARIOUS_IKARE_AKOKO,
  OKA_AKOKO,
  AJOWA,
  AKOKO_NORTH_EAST,
  HOME_TOWN_AJOWA_AKOKO,
  YAKUBU_FOLASADE,
  ONDO,
  ESE_AKOKO,
  IKARE_AKOK,
  IPE_AKOKO,
  LOKOJA,
  FLUFFY_AUGA_AKOKO,
  AKURE,
  AKUNGBA_AKOKO,
  IKUN_AKOKO
}

final homeTownValues = EnumValues({
  "AFIN Akoko": HomeTown.AFIN_AKOKO,
  "AGBO OKELA": HomeTown.AGBO_OKELA,
  "Ajowa ": HomeTown.AJOWA,
  "Ajowa Akoko": HomeTown.AJOWA_AKOKO,
  "AKOKO": HomeTown.AKOKO,
  "Akoko north-east": HomeTown.AKOKO_NORTH_EAST,
  "Akungba": HomeTown.AKUNGBA,
  "AKUNGBA AKOKO": HomeTown.AKUNGBA_AKOKO,
  "Akunu": HomeTown.AKUNU,
  "Akunu Akoko": HomeTown.AKUNU_AKOKO,
  "Akure": HomeTown.AKURE,
  "Auga Akoko": HomeTown.AUGA_AKOKO,
  "Ekan, Ikare Akolo": HomeTown.EKAN_IKARE_AKOLO,
  "Erusu Akoko ": HomeTown.ERUSU_AKOKO,
  "Ese Akoko": HomeTown.ESE_AKOKO,
  "Auga Akoko ": HomeTown.FLUFFY_AUGA_AKOKO,
  "Ikare Akoko ": HomeTown.FLUFFY_IKARE_AKOKO,
  "GEDEGEDE AKOKO": HomeTown.GEDEGEDE_AKOKO,
  "IKARE AKOKO ": HomeTown.HILARIOUS_IKARE_AKOKO,
  "AFIN AKOKO": HomeTown.HOME_TOWN_AFIN_AKOKO,
  "Ajowa akoko": HomeTown.HOME_TOWN_AJOWA_AKOKO,
  "Akoko": HomeTown.HOME_TOWN_AKOKO,
  "Auga-akoko": HomeTown.HOME_TOWN_AUGA_AKOKO,
  "IBOROPA AKOKO": HomeTown.HOME_TOWN_IBOROPA_AKOKO,
  "IKARE": HomeTown.HOME_TOWN_IKARE,
  "IKARE AKOKO": HomeTown.HOME_TOWN_IKARE_AKOKO,
  "Ise akoko": HomeTown.HOME_TOWN_ISE_AKOKO,
  "UGBE AKOKO": HomeTown.HOME_TOWN_UGBE_AKOKO,
  "I": HomeTown.I,
  "Ibaram Akoko": HomeTown.IBARAM_AKOKO,
  "Iboropa Akoko": HomeTown.IBOROPA_AKOKO,
  "IKAKUMO AKOKO": HomeTown.IKAKUMO_AKOKO,
  "IKARAMU AKOKO": HomeTown.IKARAMU_AKOKO,
  "Ikare": HomeTown.IKARE,
  "Ikare Akok": HomeTown.IKARE_AKOK,
  "Ikare Akoko": HomeTown.IKARE_AKOKO,
  "Ikare akoko ondo state": HomeTown.IKARE_AKOKO_ONDO_STATE,
  "Ikare AKoko": HomeTown.IKARE_A_KOKO,
  "IKUN AKOKO": HomeTown.IKUN_AKOKO,
  "Ikare, Akoko": HomeTown.INDECENT_IKARE_AKOKO,
  "Ikare - Akoko": HomeTown.INDIGO_IKARE_AKOKO,
  "Ipesi": HomeTown.IPESI,
  "IPE AKOKO": HomeTown.IPE_AKOKO,
  "Irun akoko": HomeTown.IRUN_AKOKO,
  "ISE AKOKO": HomeTown.ISE_AKOKO,
  "ISHE AKOKO": HomeTown.ISHE_AKOKO,
  "Lokoja": HomeTown.LOKOJA,
  "Ogbagi akoko": HomeTown.OGBAGI_AKOKO,
  "Ogheghe": HomeTown.OGHEGHE,
  "Oka akoko": HomeTown.OKA_AKOKO,
  "Okitipupa": HomeTown.OKITIPUPA,
  "Ondo": HomeTown.ONDO,
  "Ondo state ": HomeTown.ONDO_STATE,
  "OSOGBO": HomeTown.OSOGBO,
  "OWO": HomeTown.OWO,
  "AUGA AKOKO": HomeTown.PURPLE_AUGA_AKOKO,
  "Iboropa akoko": HomeTown.PURPLE_IBOROPA_AKOKO,
  "Ikare ": HomeTown.PURPLE_IKARE,
  "Ikare akoko": HomeTown.PURPLE_IKARE_AKOKO,
  "Ikare-Akoko": HomeTown.STICKY_IKARE_AKOKO,
  "IKARE-AKOKO": HomeTown.TENTACLED_IKARE_AKOKO,
  "Ugbe Akoko": HomeTown.UGBE_AKOKO,
  "YAKUBU FOLASADE": HomeTown.YAKUBU_FOLASADE
});

enum Lga {
  AKOKO_NORTH_EAST,
  OWO,
  OSE,
  ONDO_WEST,
  ONDO_EAST,
  OKITIPUPA,
  ODIGBO,
  IRELE,
  ILE_OLUJI_OKE_IGBO,
  ILAJE,
  IFEDORE,
  IDANRE,
  ESE_ODO,
  AKURE_SOUTH,
  AKURE_NORTH,
  AKOKO_NORTH_WEST,
  AKOKO_SOUTH_WEST,
  AKOKO_SOUTH_EAST
}

final lgaValues = EnumValues({
  "Akoko North East": Lga.AKOKO_NORTH_EAST,
  "Akoko North West": Lga.AKOKO_NORTH_WEST,
  "Akoko South East": Lga.AKOKO_SOUTH_EAST,
  "Akoko South West": Lga.AKOKO_SOUTH_WEST,
  "Akure North": Lga.AKURE_NORTH,
  "Akure South": Lga.AKURE_SOUTH,
  "Ese Odo": Lga.ESE_ODO,
  "Idanre": Lga.IDANRE,
  "Ifedore": Lga.IFEDORE,
  "Ilaje": Lga.ILAJE,
  "Ile Oluji/Oke Igbo": Lga.ILE_OLUJI_OKE_IGBO,
  "Irele": Lga.IRELE,
  "Odigbo": Lga.ODIGBO,
  "Okitipupa": Lga.OKITIPUPA,
  "Ondo East": Lga.ONDO_EAST,
  "Ondo West": Lga.ONDO_WEST,
  "Ose": Lga.OSE,
  "Owo": Lga.OWO
});

enum NgoMembership { NO, YES, DO_YOU_BELONG_TO_ANY_NGO }

final ngoMembershipValues = EnumValues({
  "Do you belong to any NGO? ": NgoMembership.DO_YOU_BELONG_TO_ANY_NGO,
  "NO": NgoMembership.NO,
  "YES": NgoMembership.YES
});

enum NgoName {
  N_C_W_S,
  WOWICAN,
  JESUS_BRIDE_WIDOWS_SOCIETY_ISUA_AKOKO_BRANCH_07040729300,
  HEALTHY_MOTHER_AND_CHILD_FOUNDATION,
  MELVILLE_WOMEN_INITIATIVE,
  ACF_AKOKO_CONS_FORUM,
  AKOKO_CONSULTATIVE_FORUM,
  ND
}

final ngoNameValues = EnumValues({
  "ACF(AKOKO CONS FORUM)": NgoName.ACF_AKOKO_CONS_FORUM,
  "Akoko Consultative Forum": NgoName.AKOKO_CONSULTATIVE_FORUM,
  "HEALTHY MOTHER AND CHILD FOUNDATION":
      NgoName.HEALTHY_MOTHER_AND_CHILD_FOUNDATION,
  "Jesus Bride Widows Society, Isua Akoko branch, 07040729300":
      NgoName.JESUS_BRIDE_WIDOWS_SOCIETY_ISUA_AKOKO_BRANCH_07040729300,
  "Melville Women Initiative": NgoName.MELVILLE_WOMEN_INITIATIVE,
  "ND": NgoName.ND,
  "N C W S": NgoName.N_C_W_S,
  "WOWICAN": NgoName.WOWICAN
});

enum ReceivedBy {
  NONE,
  P,
  SELF,
  MULIKATU_AYOADE,
  ABDULLAH_BAMIGBOYE,
  SON,
  S,
  BABALOLA,
  JESUS_BRIDE_WIDOWS_SOCIETY_ISUA_07040729300,
  LOLA_FAGBEMI,
  RECEIVED_BY_SELF,
  ANELGA,
  MR_GIDEON_O_FERANMI,
  OLALEYE_BUSAYO,
  GASALI_TAIBAT_ANISU,
  ADMIN,
  AREMU_KABIRU_BABATUNDE,
  ADEUSI_OLAMUTIMI_FLORENCE,
  BLESSING,
  ALFRED,
  ADEYEMO_OLUSEGUN,
  SAMUEL_OBAWOLU,
  TIMOTHY,
  ORUKOTAN_OLUTAYO
}

final receivedByValues = EnumValues({
  "Abdullah Bamigboye": ReceivedBy.ABDULLAH_BAMIGBOYE,
  "Adeusi olamutimi florence ": ReceivedBy.ADEUSI_OLAMUTIMI_FLORENCE,
  "Adeyemo olusegun": ReceivedBy.ADEYEMO_OLUSEGUN,
  "Admin": ReceivedBy.ADMIN,
  "Alfred": ReceivedBy.ALFRED,
  "ANELGA": ReceivedBy.ANELGA,
  "AREMU KABIRU BABATUNDE": ReceivedBy.AREMU_KABIRU_BABATUNDE,
  "Babalola": ReceivedBy.BABALOLA,
  "Blessing ": ReceivedBy.BLESSING,
  "GASALI TAIBAT ANISU": ReceivedBy.GASALI_TAIBAT_ANISU,
  "Jesus Bride Widows Society, Isua. 07040729300":
      ReceivedBy.JESUS_BRIDE_WIDOWS_SOCIETY_ISUA_07040729300,
  "Lola Fagbemi": ReceivedBy.LOLA_FAGBEMI,
  "Mr. Gideon O.Feranmi": ReceivedBy.MR_GIDEON_O_FERANMI,
  "MULIKATU AYOADE": ReceivedBy.MULIKATU_AYOADE,
  "None": ReceivedBy.NONE,
  "Olaleye Busayo": ReceivedBy.OLALEYE_BUSAYO,
  "Orukotan Olutayo": ReceivedBy.ORUKOTAN_OLUTAYO,
  "P": ReceivedBy.P,
  "Self": ReceivedBy.RECEIVED_BY_SELF,
  "S": ReceivedBy.S,
  "Samuel obawolu": ReceivedBy.SAMUEL_OBAWOLU,
  "SELF": ReceivedBy.SELF,
  "Son": ReceivedBy.SON,
  "Timothy": ReceivedBy.TIMOTHY
});

enum SenatorialZone { ONDO_NORTH_SENATORIAL_DISTRICT }

final senatorialZoneValues = EnumValues({
  "Ondo North Senatorial District":
      SenatorialZone.ONDO_NORTH_SENATORIAL_DISTRICT
});

enum State { ONDO, KOGI, SELECT_STATE_OF_ORIGIN, OSUN, OGUN, EDO }

final stateValues = EnumValues({
  "Edo": State.EDO,
  "Kogi": State.KOGI,
  "Ogun": State.OGUN,
  "Ondo": State.ONDO,
  "Osun": State.OSUN,
  "Select State of Origin": State.SELECT_STATE_OF_ORIGIN
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
